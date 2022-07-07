import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/presentation/bloc/glass_compatibilities_cubit/compatibilities_states.dart';
import 'package:wafaq_x/presentation/bloc/glass_compatibilities_cubit/glass_compatibilities_bloc.dart';
import 'package:wafaq_x/presentation/bloc/mobile_covers_compatibilities_cubit/mobile_covers_compatibilities_state.dart';
import 'package:wafaq_x/presentation/bloc/mobile_covers_compatibilities_cubit/mobile_covers_compatibities_bloc.dart';
import 'package:wafaq_x/presentation/bloc/screens_compatibilities/screensCompatibilitiesBloc.dart';
import 'package:wafaq_x/presentation/bloc/screens_compatibilities/screens_compatibilities_states.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/entities/arguments/compatibilities_page_arguments.dart';
import 'package:wafaq_x/presentation/extensions/wrappedRoundedCorner.dart';
import 'package:wafaq_x/presentation/widgets/images/brandLogo.dart';
import 'package:wafaq_x/presentation/widgets/lists/compatibilities_list.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';
import '../widgets/texts/helper_text.dart';

class CompatibilitiesPage extends StatefulWidget {
  const CompatibilitiesPage({Key? key}) : super(key: key);


  @override
  _CompatibilitiesPageState createState() => _CompatibilitiesPageState();
}

class _CompatibilitiesPageState extends State<CompatibilitiesPage> {
  late CompatibilitiesPageArgument arguments;

  bool _screenSelected = true;
  bool _coversSelected = false;
  bool _glassSelected = false;
  late List<MobileWithThemeModel> _mobilesWithTheme;
  late MobileModel mobileModel;
  late String brandLogo;
  late Color brandColor;

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as CompatibilitiesPageArgument;
    mobileModel = arguments.mobileWithTheme.mobileModel;
    brandLogo = arguments.mobileWithTheme.brandLogo;
    brandColor = arguments.mobileWithTheme.brandColor;

    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
          padding: padding8,
          child: ListView(
            children: [
              gap8,
// brand logo
              brandLogoWidget(brandLogo: brandLogo, brandColor: brandColor),
              gap8,
// mobile name
              Text(
                mobileModel.mobileName,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: size24,
                ),
              ).wrappedRoundedCorner(brandColor: brandColor),
              gap16,
// available compatibilities helper text
              const HelperText(
                helperText: hereAvailableCompatibilities,
              ),
              gap8,
// categories
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
// glasses checkBox
                  const Text(
                    glassText,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: _glassSelected,
                    onChanged: (value) {
                      setState(() {
                        _glassSelected = true;
                        _coversSelected = _screenSelected = false;

                      });
                    },
                  ),
// covers checkBox
                  const Text(
                    coversText,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: _coversSelected,
                    onChanged: (value) {
                      setState(() {
                        _coversSelected = true;
                        _glassSelected = _screenSelected = false;

                      });
                    },
                  ),
// screens checkBox
                  const Text(
                    screensText,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: _screenSelected,
                    onChanged: (value) {
                      setState(() {
                        _screenSelected = true;
                        _glassSelected = _coversSelected = false;
                      });
                    },
                  ),
                ],
              ),

              const SkinnyDivider(),
              gap8,
              const SideTitle(title: compatibilitiesText),
// list of results
              compatibilitiesList(),


            ],
          )),
    );
  }

  compatibilitiesList(){
// if user selected screen compatibilities
    if (_screenSelected){
      return BlocBuilder<ScreensCompatibilitiesCubit, ScreensCompatibilitiesState>(
        builder: (context, state){
          if (state is ScreensCompatibilitiesLoadInProgress){
            return const Loading();
          }
          else if (state is ScreensCompatibilitiesLoadSuccess){
            _mobilesWithTheme = state.mobilesWithTheme;
            if (state.mobilesWithTheme.isEmpty){
              return const NoResultsFound();
            }else{
              return CompatibilitiesList(mobilesWithTheme: _mobilesWithTheme);
            }
          }
          else {
            return const ErrorOccurred();
          }
        },
      );
    }
// if user select covers compatibilities
    else if (_coversSelected){
      return BlocBuilder<MobileCoversCompatibilitiesCubit, MobileCoversCompatibilitiesState>(
        builder: (context, state){
          if (state is MobileCoversCompatibilitiesLoadInProgress){
            return const Loading();
          }
          else if (state is MobileCoversCompatibilitiesLoadSuccess){
            _mobilesWithTheme = state.mobilesWithThemeModel;
            if (state.mobilesWithThemeModel.isEmpty){
              return const NoResultsFound();
            }else{
              return CompatibilitiesList(mobilesWithTheme: _mobilesWithTheme);
            }
          }
          else {
            return const ErrorOccurred();
          }
        },
      );
    }
// if user select glass compatibilities
    else{
      return BlocBuilder<GlassCompatibilitiesCubit, GlassCompatibilitiesState>(
        builder: (context, state){
          if (state is MobileCoversCompatibilitiesLoadInProgress){
            return const Loading();
          }
          else if (state is GlassCompatibilitiesLoadSuccess){
            _mobilesWithTheme = state.mobilesWithTheme;
            if (state.mobilesWithTheme.isEmpty){
              return const NoResultsFound();
            }else{
              return CompatibilitiesList(mobilesWithTheme: _mobilesWithTheme);
            }
          }
          else {
            return const ErrorOccurred();
          }
        },
      );
    }
  }

}
