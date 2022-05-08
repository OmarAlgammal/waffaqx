
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';

class WipeTextButton extends StatelessWidget {
  const WipeTextButton({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Text(
          clearText,
        )
    );
  }
}
