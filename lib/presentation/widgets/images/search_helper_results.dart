
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/presentation/constants/texts/paths.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/widgets/images/image_from_assets.dart';


class SearchResultHelper extends StatelessWidget {
  const SearchResultHelper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageFromAssets(path: searchHelperImagePath),
        gap8,
        const Text(
          searchResultHelperText,
        )
      ],
    );
  }
}
