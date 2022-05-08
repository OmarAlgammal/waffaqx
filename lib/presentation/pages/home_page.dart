import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_cubit.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_state.dart';
import 'package:wafaq_x/presentation/constants/constantsIcons.dart';
import 'package:wafaq_x/presentation/constants/texts/paths.dart';
import 'package:wafaq_x/presentation/pages/all_covers_compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/set_admin_page.dart';
import 'package:wafaq_x/presentation/pages/add_mobile_page.dart';
import 'package:wafaq_x/presentation/pages/add_covers_compatibility_page.dart';
import 'package:wafaq_x/presentation/pages/search_for_compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/start_page.dart';
import 'package:wafaq_x/presentation/widgets/images/image_from_assets.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/brand_item_design.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/texts/helper_text.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';
import 'package:wafaq_x/presentation/widgets/search_box.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String routeName = 'homeScreen';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late RegisterState _registerState;

  @override
  Widget build(BuildContext context) {
    _registerState = BlocProvider.of<RegisterCubit>(context).state;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: whiteColor,
        body: CustomScrollView(
          slivers: [
            mySliverAppBar(context: context),
            SliverPadding(
              padding: padding8,
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    gap24,
                    const HelperText(helperText: searchForCompatibilitiesText),
                    SearchBox(onPressed: (){
                      Navigator.pushNamed(context, SearchForCompatibilitiesPage.routeName);
                    },),
                    gap16,
                    const Align(
                      alignment: Alignment.centerRight,
                      child: SideTitle(title: brandsText),
                    ),
                    gap8,
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: padding0,
                      itemCount: brandsLogosTextsList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            BrandItemDesign(
                              brandName: brandsNamesTextsList[index],
                                brandLogo: brandsLogosTextsList[index],
                                brandColor: brandsColors[index]),
                            gap8,
                          ],
                        );
                      },
                    ),
                  ]
                ),
              )
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar mySliverAppBar({required BuildContext context}) {
    return SliverAppBar(
      backgroundColor: brightGrayColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: brightGrayColor,
        statusBarIconBrightness: Brightness.dark
      ),
      titleSpacing: size0,
      automaticallyImplyLeading: false,
      toolbarHeight: size72,
      floating: true,
      elevation: size12,
      title: Padding(
        padding: paddingH8,
        child: Row(
          children: [
            gap8,
            SizedBox(
              child: ImageFromAssets(
                path: appLogoPath,
              ),
            ),
          ],
        ),
      ),
      actions: [
// add icon
        Visibility(
          visible: (_registerState is AdminSignedInSuccessfully)? true: false,
          child: SizedBox(
            width: size36,
            child: IconButton(
              icon: const Icon(
                addIcon,
                color: blackColor,
              ),
              onPressed: () {
                modalBottomSheet();
              },
            ),
          ),
        ),
// more icon
        SizedBox(
          width: size36,
          child: IconButton(
            icon: const Icon(
              moreIcon,
              color: blackColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: newGrayColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(size16), topRight: Radius.circular(size16))
                  ),
                  builder: (BuildContext context) {
                    return Wrap(
                        children: [
                          Padding(
                            padding: padding16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: TextDirection.rtl,
                              children: [
// compatibilities button
                                Visibility(
                                  visible: (_registerState is AdminSignedInSuccessfully)? true: false,
                                  child: TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                        Navigator.pushNamed(context, AllCoversCompatibilitiesPage.routeName);
                                      },
                                      child: const Text(
                                        compatibilitiesText,
                                        style: TextStyle(
                                            fontSize: size16,
                                            color: blackColor
                                        ),
                                      )
                                  ),
                                ),
                                const SkinnyDivider(),
// log out button
                                TextButton(
                                  onPressed: (){
                                    // todo: bloc builder in start page not being updated
                                    BlocProvider.of<RegisterCubit>(context).singOut();
                                    Navigator.pushReplacementNamed(context, StartPage.routeName);
                                  },
                                  child: const Text(
                                    logOutText,
                                    style: TextStyle(
                                        fontSize: size16,
                                        color: blackColor
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]);
                  });
            },
          ),
        ),
        gap16,
      ],
    );
  }

  modalBottomSheet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: newGrayColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(size16), topRight: Radius.circular(size16))
        ),
        builder: (BuildContext context) {
          return Wrap(
              children: [
            Padding(
              padding: padding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AddMobilePage.routeName);
                    },
                      child: const Text(
                        addNewMobileText,
                        style: TextStyle(
                            fontSize: size16,
                            color: blackColor
                        ),
                      )
                  ),
                  const SkinnyDivider(),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, SetAdminPage.routeName);
                    },
                    child: const Text(
                      setNewAdminText,
                      style: TextStyle(
                          fontSize: size16,
                          color: blackColor
                      ),
                    ),
                  ),
                  const SkinnyDivider(),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AddSelectionPage.routeName);
                    },
                    child: const Text(
                      addCoversCompatibilitiesText,
                      style: TextStyle(
                          fontSize: size16,
                          color: blackColor
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        });
  }

}
