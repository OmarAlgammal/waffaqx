import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/bloc/all_mobiles_cubit/all_mobiles_cubit.dart';
import 'package:wafaq_x/presentation/bloc/all_mobiles_cubit/all_mobiles_state.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/extensions/roundedCorner.dart';
import 'package:wafaq_x/presentation/helper/mobiles_filtration_helper.dart';
import 'package:wafaq_x/presentation/widgets/buttons/wipeTextButton.dart';
import 'package:wafaq_x/presentation/widgets/lists/mobiles_list.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import 'package:wafaq_x/presentation/widgets/images/search_helper_results.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/texts/helper_text.dart';

class SearchForCompatibilitiesPage extends StatefulWidget {
  const SearchForCompatibilitiesPage({Key? key}) : super(key: key);

  @override
  _SearchForCompatibilitiesPageState createState() =>
      _SearchForCompatibilitiesPageState();
}

class _SearchForCompatibilitiesPageState
    extends State<SearchForCompatibilitiesPage> {

  bool _noSearchResults = true;
  final TextEditingController _searchTextController = TextEditingController();
  final MobilesFiltrationHelper _filtrationHelper = MobilesFiltrationHelper();
  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: whiteColor,
              body: Padding(
                padding: padding8,
                child: ListView(
                  children: [
                    gap24,
                    const HelperText(helperText: searchForCompatibilitiesHelperText),
                    gap8,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
// search text field
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: paddingH8,
                            child: TextField(
                              controller: _searchTextController,
                              autofocus: true,
                              textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                hintText: searchHintText,
                                hintTextDirection: TextDirection.rtl,
                                border: InputBorder.none,
                                fillColor: whiteColor,
                                focusColor: whiteColor,
                              ),
                              onChanged: (String searchText) {
                                if (searchText.trim().isNotEmpty) {
                                  setState(() {
                                    _noSearchResults = false;
                                  });
                                } else {
                                  setState(() {
                                    _noSearchResults = true;
                                  });
                                }
                              },
                            ).roundedCorner(color: brightGrayColor),
                          ),
                        ),
// clear search text
                        Padding(
                            padding: paddingH4,
                            child: WipeTextButton(onPressed: (){
                              setState(() {
                                setState(() {
                                  _noSearchResults = true;
                                  _searchTextController.clear();
                                });
                              });
                            },)
                          //clearSearchButtonWidget(),
                        ),
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
                          var searchResults = _filtrationHelper.filterSearchResults(mobilesWithTheme: state.mobilesWithThemeModel, searchText: _searchTextController.text);

                          if (_noSearchResults){
                            return const SearchResultHelper();
                          }
                          else if (searchResults.isEmpty){
                            return const NoResultsFound();
                          }
                          else {
                            return MobilesList(mobilesWithTheme: searchResults);
                          }
                        }
                        else {
                          return const ErrorOccurred();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

}
