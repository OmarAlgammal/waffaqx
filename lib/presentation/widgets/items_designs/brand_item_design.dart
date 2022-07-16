
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/models/arguments/brandScreenArguments.dart';
import 'package:wafaq_x/utilities/extensions/roundedCorner.dart';
import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/routes.dart';

class BrandItemDesign extends StatelessWidget {
  const BrandItemDesign({Key? key, required this.brandName, required this.brandLogo, required this.brandColor}) : super(key: key);

  final String brandName, brandLogo;
  final Color brandColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.pushNamed(context, AppRoutes.brandPage,
            arguments: BrandScreenArguments(
                brandName: brandName,
                brandLogo: brandLogo,
                brandColor: brandColor,));
      },
        child: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(
            brandLogo,
            color: whiteColor,
          ),
        ),
    ).roundedCorner(color: brandColor);

  }
}
