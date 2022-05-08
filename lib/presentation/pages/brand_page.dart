import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/data_source/firebase_data_source.dart';
import 'package:wafaq_x/data/repos/compatibilities_repository_impl.dart';
import 'package:wafaq_x/data/repos/mobiles_repository_impl.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/brand_mobiles_cubit/brand_mobiles_cubit.dart';
import 'package:wafaq_x/presentation/bloc/brand_mobiles_cubit/brand_mobiles_states.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/widgets/icons/right_arrow_icon_button.dart';
import 'package:wafaq_x/presentation/widgets/images/brandLogo.dart';
import 'package:wafaq_x/presentation/widgets/images/mobiles_empty.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';
import 'package:wafaq_x/presentation/widgets/icons/wipe_icon_button.dart';
import 'package:wafaq_x/presentation/widgets/icons/search_icon.dart';
import 'package:wafaq_x/presentation/helper/mobiles_filtration_helper.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/lists/mobiles_list.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import '../entities/arguments/brandScreenArguments.dart';

class BrandPage extends StatefulWidget {
  const BrandPage({Key? key}) : super(key: key);

  static const String routeName = 'BrandScreen';

  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  late BrandScreenArguments arguments;

  final MobilesFiltrationHelper _mobilesFiltrationHelper =
      MobilesFiltrationHelper();
  final TextEditingController _searchController = TextEditingController();
  bool searching = false;
  bool noSearchResult = false;

  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)!.settings.arguments as BrandScreenArguments;
    return BlocProvider<BrandMobilesCubit>(
      create: (context) => BrandMobilesCubit(CompatibilitiesUseCases(CompatibilitiesRepositoryImpl(FirebaseDataSource()),
        MobilesRepositoryImpl(FirebaseDataSource())),)..loadBrandMobiles(brandName: arguments.brandName),
      child:  Scaffold(
          backgroundColor: whiteColor,
          appBar: searching ? appBarForSearch() : myAppBar(),
          body: Padding(
            padding: padding8,
            child: Column(
              children: [
                const SideTitle(title: mobilesListText),
                BlocBuilder<BrandMobilesCubit, BrandMobilesState>(
                    builder: (context, state) {
                      if (state is BrandMobilesLoadInProgress) {
                        return const Loading();
                      } else if (state is BrandMobilesLoadSuccess) {

                        var searchResults = _mobilesFiltrationHelper.filterSearchResults(mobilesWithTheme: state.mobilesWithTheme, searchText: _searchController.text);

                        if (searching && searchResults.isEmpty){
                          return const NoResultsFound();
                        }
                        else if (!searching && searchResults.isEmpty){
                          return const MobilesEmpty();
                        }
                        else{
                          return MobilesList(mobilesWithTheme: searchResults);
                        }
                      } else {
                        return const ErrorOccurred();
                      }
                    })
              ],
            ),
          )),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: arguments.brandColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: arguments.brandColor,
      toolbarHeight: size72,
      titleSpacing: size0,
      elevation: size12,
      shadowColor: arguments.brandColor,
      title: brandLogoWidget(
          brandLogo: arguments.brandLogo, brandColor: arguments.brandColor),
      actions: [
        SearchIcon(onPressed: (){
          setState(() {
            searching = true;
          });
        },),
        gap16
      ],
    );
  }

  AppBar appBarForSearch() {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: arguments.brandColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: arguments.brandColor,
      toolbarHeight: size72,
      titleSpacing: size8,
      elevation: size12,
      shadowColor: arguments.brandColor,
      title: TextFormField(
        controller: _searchController,
        onChanged: (searchText) {
          setState(() {
            // to rebuild the page only
          });
        },
        autofocus: true,
        style: const TextStyle(color: whiteColor),
        decoration: const InputDecoration(
            focusColor: whiteColor,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: whiteColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: grayColor,
            ))),
      ),
      actions: [
        WipeIcon(onPressed: (){
          setState(() {
            _searchController.clear();
            searching = false;
          });
        },),
        gap8,
        RightArrowIconButton(onPressed: (){
          setState(() {
            searching = false;
          });
        }),
      ],
    );
  }
}
