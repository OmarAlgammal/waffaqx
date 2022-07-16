
import 'package:flutter/material.dart';

import '../../../utilities/constants/texts/texts.dart';

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
