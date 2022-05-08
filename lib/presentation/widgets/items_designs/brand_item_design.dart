
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/entities/arguments/brandScreenArguments.dart';
import 'package:wafaq_x/presentation/extensions/roundedCorner.dart';
import 'package:wafaq_x/presentation/pages/brand_page.dart';

class BrandItemDesign extends StatelessWidget {
  const BrandItemDesign({Key? key, required this.brandName, required this.brandLogo, required this.brandColor}) : super(key: key);

  final String brandName, brandLogo;
  final Color brandColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        Navigator.pushNamed(context, BrandPage.routeName,
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
