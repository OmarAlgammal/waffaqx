import 'package:flutter/material.dart';
import 'package:wafaq_x/models/arguments/mobile_page_arguments.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';

import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/constants/constantsDimens.dart';
import '../../../utilities/routes.dart';

class SelectionMobileItemDesign extends StatelessWidget {
  const SelectionMobileItemDesign({Key? key, required this.mobileWithTheme})
      : super(key: key);

  final MobileWithThemeModel mobileWithTheme;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: paddingV4,
        child: ListTile(
            onTap: () {
              Navigator.pop(context, mobileWithTheme);
            },
            contentPadding: paddingH8,
            tileColor: mobileWithTheme.brandColor,
            shape: const RoundedRectangleBorder(
              borderRadius: circular12,
            ),
            title: Text(
              mobileWithTheme.mobileModel.mobileName,
              style: const TextStyle(color: whiteColor),
            ),
            trailing: IconButton(
              padding: padding0,
              icon: const Icon(
                Icons.article_outlined,
                color: whiteColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.mobilePage,
                    arguments:
                        MobilePageArguments(mobileWithTheme: mobileWithTheme));
              },
            )),
      ),
    );
  }
}
