
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/widgets/images/image_from_assets.dart';
import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/constants/texts/paths.dart';

class MobilesListIsEmpty extends StatelessWidget {
  const MobilesListIsEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageFromAssets(path: emptyListImagePath, color: blackColor);
  }
}
