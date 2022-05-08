
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsIcons.dart';

class RightArrowIconButton extends StatelessWidget {
  const RightArrowIconButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: const Icon(
        rightArrowIcon,
        color: whiteColor,
      ),
    );
  }
}
