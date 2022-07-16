import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_bloc.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_event.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_state.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/buttons/wipeTextButton.dart';
import 'package:wafaq_x/presentation/widgets/lists/selection_mobile_list.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/texts/helper_text.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import 'package:wafaq_x/utilities/extensions/roundedCorner.dart';

import '../../utilities/constants/constantsColors.dart';
import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/texts.dart';
import '../../utilities/helper/mobiles_filtration_helper.dart';


class SelectionMobilePage extends StatefulWidget {
  const SelectionMobilePage({Key? key}) : super(key: key);

  @override
  _SelectionMobilePageState createState() => _SelectionMobilePageState();
}

class _SelectionMobilePageState extends State<SelectionMobilePage> {

  final TextEditingController _searchTextController = TextEditingController();
  final MobilesFiltrationHelper _mobilesHelper = MobilesFiltrationHelper();
  late List<MobileWithThemeModel> _searchResult;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MobilesBloc>(context).add(LoadMobiles());
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: padding8,
            child: ListView(
              children: [
                gap24,
                HelperText(helperText: selectFirstMobileText),
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
                BlocBuilder<MobilesBloc, MobilesState>(
                  builder: (context, state){
                    if (state is MobilesLoading){
                      return const Loading();
                    }
                    else if (state is MobilesLoadedSuccessfully){
                      // get search results
                      _searchResult = _mobilesHelper.getSearchResultWithTheme(mobilesWithTheme: state.mobilesWithTheme, searchText: _searchTextController.text);
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
