
import 'package:flutter/material.dart';

import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/constants/constantsDimens.dart';

class HelperText extends StatelessWidget {
  const HelperText({Key? key, required this.helperText}) : super(key: key);

  final String helperText;

  @override
  Widget build(BuildContext context) {
    return Text(
      helperText,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
      style: const TextStyle(
        color: blackColor,
        fontSize: size24,
      ),
    );
  }
}
