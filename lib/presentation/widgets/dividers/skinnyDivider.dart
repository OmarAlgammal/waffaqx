
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';

class SkinnyDivider extends StatelessWidget {
  const SkinnyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: brightGrayColor,
      thickness: size1,
      height: size3,
    );
  }
}
