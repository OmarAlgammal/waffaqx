
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/texts/paths.dart';
import 'package:wafaq_x/presentation/widgets/images/image_from_assets.dart';

class MobilesEmpty extends StatelessWidget {
  const MobilesEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImageFromAssets(path: emptyListImagePath, color: blackColor),
      ],
    );
  }
}
