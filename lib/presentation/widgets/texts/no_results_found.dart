
import 'package:flutter/material.dart';
import '../../../utilities/constants/texts/texts.dart';


class NoResultsFound extends StatelessWidget {
  const NoResultsFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          NoResultsFoundText,
        )
      ],
    );
  }
}
