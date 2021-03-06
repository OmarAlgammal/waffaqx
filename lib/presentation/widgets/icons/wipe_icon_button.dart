
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/widgets/icons/icon_from_assets.dart';

import '../../../utilities/constants/constantsDimens.dart';
import '../../../utilities/constants/texts/paths.dart';

class WipeIcon extends StatelessWidget {
  const WipeIcon({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SizedBox(
        width: size16,
        height: size16,
        child: IconFromAssets(path: wipeIconPath),
      ),
    );
  }
}
