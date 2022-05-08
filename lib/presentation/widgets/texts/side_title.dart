

import 'package:flutter/cupertino.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';


class SideTitle extends StatelessWidget {
  const SideTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          color: blackColor,
          fontSize: size16,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
