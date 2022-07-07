import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/entities/arguments/mobile_page_arguments.dart';
import 'package:wafaq_x/presentation/pages/mobile_page.dart';
import 'package:wafaq_x/presentation/utilities/routes.dart';

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
