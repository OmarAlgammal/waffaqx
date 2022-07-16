import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/auth_cubit/log_cubit.dart';
import 'package:wafaq_x/controllers/auth_cubit/log_state.dart';
import 'package:wafaq_x/presentation/widgets/images/image_from_assets.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/brand_item_design.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/show_my_snack_bar.dart';
import 'package:wafaq_x/presentation/widgets/texts/helper_text.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';
import 'package:wafaq_x/presentation/widgets/search_box.dart';
import 'package:wafaq_x/utilities/enums/authenticators.dart';

import '../../utilities/constants/constantsColors.dart';
import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/constantsIcons.dart';
import '../../utilities/constants/texts/paths.dart';
import '../../utilities/constants/texts/texts.dart';
import '../../utilities/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _registerState;

  @override
  Widget build(BuildContext context) {
    // TODO: register state
    //_registerState = BlocProvider.of<RegisterCubit>(context).state;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: myAppBar(context: context),
          body: Padding(
            padding: EdgeInsets.only(right: size8, left: size8, top: size8),
            child: ListView(
              children: [
                const HelperText(helperText: searchForCompatibilitiesText),
                SearchBox(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRoutes.searchForCompatibilitiesPage);
                  },
                ),
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
              ],
            ),
          ),
        )

    );
  }

  AppBar myAppBar({required BuildContext context}) {
    LogInSuccessfully logInSuccessfully = BlocProvider.of<LogCubit>(context).state as LogInSuccessfully;
    bool adminIsLogin = logInSuccessfully.authenticators == Authenticators.admin;
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: whiteColor,
          statusBarIconBrightness: Brightness.dark),
      automaticallyImplyLeading: false,
      shadowColor: whiteColor,
      backgroundColor: whiteColor,
      toolbarHeight: size120,
      elevation: size0,
      centerTitle: true,
      title: SizedBox(
        child: ImageFromAssets(
          path: appLogoPath,
        ),
      ),
      actions: [
// add icon

      if (adminIsLogin)
        SizedBox(
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
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(size16),
                          topRight: Radius.circular(size16))),
                  builder: (_) {
                    return Wrap(children: [
                      Padding(
                        padding: padding16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
// compatibilities button
                            if (adminIsLogin)
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context,
                                      AppRoutes.allCoversCompatibilitiesPage);
                                },
                                child: const Text(
                                  coversCompatibilitiesText,
                                  style: TextStyle(
                                      fontSize: size16, color: blackColor),
                                )),
                            const SkinnyDivider(),
// log out button
                            BlocListener<LogCubit, LogState>(
                              listener: (context, state) {
                                if (state is LoggedOutSuccessfully)
                                  Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
                                else if (state is LogFailed)
                                  showMySnackBar(context: context, content: logOutFailedText, color: redColor);
                              },
                              child: TextButton(
                                onPressed: () async {
                                  await BlocProvider.of<LogCubit>(context)
                                      .logout();
                                },
                                child: const Text(
                                  logOutText,
                                  style: TextStyle(
                                      fontSize: size16, color: blackColor),
                                ),
                              ),
                            )
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
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size16),
                topRight: Radius.circular(size16))),
        builder: (BuildContext context) {
          return Wrap(children: [
            Padding(
              padding: padding16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRoutes.addMobilePage);
                      },
                      child: const Text(
                        addNewMobileText,
                        style: TextStyle(fontSize: size16, color: blackColor),
                      )),
                  const SkinnyDivider(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoutes.setAdminPage);
                    },
                    child: const Text(
                      setNewAdminText,
                      style: TextStyle(fontSize: size16, color: blackColor),
                    ),
                  ),
                  const SkinnyDivider(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoutes.addSelectionPage);
                    },
                    child: const Text(
                      addCoversCompatibilitiesText,
                      style: TextStyle(fontSize: size16, color: blackColor),
                    ),
                  ),
                ],
              ),
            ),
          ]);
        });
  }
}
