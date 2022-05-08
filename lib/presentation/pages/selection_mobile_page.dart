
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/bloc/all_mobiles_cubit/all_mobiles_cubit.dart';
import 'package:wafaq_x/presentation/bloc/all_mobiles_cubit/all_mobiles_state.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/extensions/roundedCorner.dart';
import 'package:wafaq_x/presentation/helper/mobiles_filtration_helper.dart';
import 'package:wafaq_x/presentation/widgets/buttons/wipeTextButton.dart';
import 'package:wafaq_x/presentation/widgets/texts/helper_text.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import 'package:wafaq_x/presentation/widgets/lists/selection_mobile_list.dart';

class SelectionMobilePage extends StatefulWidget {
  const SelectionMobilePage({Key? key}) : super(key: key);


  static const String routeName = 'selectionDevicePage';

  @override
  _SelectionMobilePageState createState() => _SelectionMobilePageState();
}

class _SelectionMobilePageState extends State<SelectionMobilePage> {

  final TextEditingController _searchTextController = TextEditingController();
  final MobilesFiltrationHelper _mobilesHelper = MobilesFiltrationHelper();
  late List<MobileWithThemeModel> _searchResult;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: padding8,
            child: ListView(
              children: [
                gap24,
                const HelperText(helperText: selectFirstDeviceText),
                gap24,
                Row(
                  children: [
                    WipeTextButton(onPressed: (){
                      setState(() {
                        _searchTextController.clear();
                      });
                    },),
                    searchTextField(),
                  ],
                ),
                gap16,
                const SkinnyDivider(),
                gap8,
                BlocBuilder<AllMobilesCubit, AllMobilesState>(
                  builder: (context, state){
                    if (state is AllMobilesLoadInProgress){
                      return const Loading();
                    }
                    else if (state is AllMobilesLoadSuccess){
                      // get search results
                      _searchResult = _mobilesHelper.filterSearchResults(mobilesWithTheme: state.mobilesWithThemeModel, searchText: _searchTextController.text);
                      if (_searchTextController.text.trim().isEmpty){
                        return SelectionMobileList(mobilesWithTheme: _searchResult);
                      }
                      // if there is no search results
                      else if (_searchResult.isEmpty){
                        return const NoResultsFound();
                      }
                      else {
                        return SelectionMobileList(mobilesWithTheme: _searchResult);
                      }
                    }
                    else {
                      return const ErrorOccurred();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchTextField() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: paddingH8,
        child: TextField(
          controller: _searchTextController,
          autofocus: true,
          textDirection: TextDirection.rtl,
          onChanged: (String text){
            setState(() {

            });
          },
          decoration: const InputDecoration(
            hintText: searchHintText,
            hintTextDirection: TextDirection.rtl,
            border: InputBorder.none,
            fillColor: whiteColor,
            focusColor: whiteColor,
          ),
        ).roundedCorner(color: brightGrayColor),
      ),
    );
  }

}
