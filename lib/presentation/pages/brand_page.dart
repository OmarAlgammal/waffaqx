import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_bloc.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_event.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_state.dart';
import 'package:wafaq_x/models/arguments/brandScreenArguments.dart';
import 'package:wafaq_x/presentation/widgets/icons/right_arrow_icon_button.dart';
import 'package:wafaq_x/presentation/widgets/images/brandLogo.dart';
import 'package:wafaq_x/presentation/widgets/images/mobiles_list_is_empty.dart';
import 'package:wafaq_x/presentation/widgets/lists/mobiles_list.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';
import 'package:wafaq_x/presentation/widgets/icons/wipe_icon_button.dart';
import 'package:wafaq_x/presentation/widgets/icons/search_icon.dart';
import '../../utilities/constants/constantsColors.dart';
import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/texts.dart';
import '../../utilities/helper/mobiles_filtration_helper.dart';


class BrandPage extends StatefulWidget {
  const BrandPage({Key? key}) : super(key: key);


  @override
  State<BrandPage> createState() => _BrandPageState();
}

class _BrandPageState extends State<BrandPage> {
  late BrandScreenArguments arguments;

  final MobilesFiltrationHelper _filtrationHelper =
      MobilesFiltrationHelper();
  final TextEditingController _searchController = TextEditingController();
  bool _searching = false;
  bool _noSearchResult = false;

  @override
  Widget build(BuildContext context) {
    arguments =
        ModalRoute.of(context)!.settings.arguments as BrandScreenArguments;
    BlocProvider.of<MobilesBloc>(context).add(LoadBrandMobiles(brandName: arguments.brandName));

    return Scaffold(
        backgroundColor: whiteColor,
        appBar: _searching ? appBarForSearch() : myAppBar(),
        body: Padding(
          padding: padding8,
          child: Column(
            children: [
              const SideTitle(title: mobilesListText),
              BlocBuilder<MobilesBloc, MobilesState>(
                buildWhen: (context, state){
                  if (state is BrandMobilesLoadSuccessfully || state is MobilesLoading || state is MobilesLoadedFailed)
                    return true;
                  return false;
                },
                builder: (context, state){
                  if (state is MobilesLoading){
                    return const Loading();
                  }
                  else if (state is BrandMobilesLoadSuccessfully){
                    var searchResults = _filtrationHelper.getSearchResultWithTheme(mobilesWithTheme: state.mobilesWithTheme, searchText: _searchController.text);
                    if (_searching){
                      if (searchResults.isNotEmpty)
                        return MobilesList(mobilesWithTheme: searchResults);
                      return NoResultsFound();
                    }
                    if (state.mobilesWithTheme.isEmpty){
                      return const MobilesListIsEmpty();
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
        ));
  }

  AppBar myAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: arguments.brandColor,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: arguments.brandColor,
      titleSpacing: size0,
      elevation: size12,
      shadowColor: arguments.brandColor,
      title: brandLogoWidget(
          brandLogo: arguments.brandLogo, brandColor: arguments.brandColor),
      actions: [
        SearchIcon(onPressed: (){
          setState(() {
            _searching = true;
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
          });
        },),
        gap8,
        RightArrowIconButton(onPressed: (){
          setState(() {
            _searching = false;
          });
        }),
      ],
    );
  }
}
