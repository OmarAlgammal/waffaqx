
import 'package:flutter/material.dart';
import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/constants/constantsIcons.dart';

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
