
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';

class IconFromAssets extends StatelessWidget {
  const IconFromAssets({Key? key, required this.path, this.color}) : super(key: key);

  final String path;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(path, color: color?? whiteColor,);
  }
}
