import 'package:flutter/material.dart';
import 'package:wafaq_x/utilities/constants/constantsColors.dart';

import '../../../utilities/constants/constantsDimens.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size.fromHeight(size56),
        backgroundColor: vodkaColor,

        shape: const RoundedRectangleBorder(
            borderRadius: circular_infinity,
            side: BorderSide(
                color: vodkaColor,
                width: size2
            )
        ),
      ),
      onPressed: () {  },
      child: SizedBox(
        height: size24,
        width: size24,
        child: Center(
          child: CircularProgressIndicator(
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
