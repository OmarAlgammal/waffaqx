
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/delete_comp_cubit/delete_comp_cubit.dart';
import 'package:wafaq_x/models/arguments/compatibilities_page_arguments.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';

import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/constants/constantsDimens.dart';
import '../../../utilities/constants/constantsIcons.dart';
import '../../../utilities/routes.dart';


class AllCoversCompatibilitiesListItemDesign extends StatelessWidget {
  const AllCoversCompatibilitiesListItemDesign({Key? key, required this.mobileWithTheme, required this.onPressed}) : super(key: key);

  final MobileWithThemeModel mobileWithTheme;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: paddingV4,
        child: ListTile(
            contentPadding: paddingH8,
            tileColor: mobileWithTheme.brandColor,
            shape: const RoundedRectangleBorder(
              borderRadius: circular12,
            ),
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.compatibilitiesPage, arguments: CompatibilitiesPageArgument(mobileWithTheme: mobileWithTheme));
            },
            title: Text(
              mobileWithTheme.mobileModel.mobileName,
              style: const TextStyle(color: whiteColor),
            ),
            trailing: IconButton(
              padding: padding0,
              icon: const Icon(
                removeCircularIcon,
                color: whiteColor,
              ),
              onPressed: onPressed,
            )
        ),
      ),
    );
  }
}
