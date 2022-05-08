

import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';

class ThickDivider extends StatelessWidget {
  const ThickDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: brightGrayColor,
      thickness: size3,
      height: size3,
    );
  }
}
