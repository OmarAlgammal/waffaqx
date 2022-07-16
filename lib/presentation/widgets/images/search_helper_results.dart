
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/widgets/images/image_from_assets.dart';

import '../../../utilities/constants/constantsDimens.dart';
import '../../../utilities/constants/texts/paths.dart';
import '../../../utilities/constants/texts/texts.dart';


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
