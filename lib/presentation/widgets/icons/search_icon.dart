import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wafaq_x/presentation/widgets/icons/icon_from_assets.dart';

import '../../../utilities/constants/constantsDimens.dart';
import '../../../utilities/constants/texts/paths.dart';


class SearchIcon extends StatelessWidget {
  const SearchIcon({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SizedBox(
        width: size18,
        height: size18,
        child:IconFromAssets(path: searchIconPath),
      ),
    );
  }
}
