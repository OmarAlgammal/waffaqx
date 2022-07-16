
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/utilities/extensions/wrappedRoundedCorner.dart';

import '../../../utilities/constants/constantsColors.dart';


Widget brandLogoWidget({required String brandLogo, required Color brandColor}){
  return SvgPicture.asset(
    brandLogo,
    color: whiteColor,
  ).wrappedRoundedCorner(brandColor: brandColor);
}