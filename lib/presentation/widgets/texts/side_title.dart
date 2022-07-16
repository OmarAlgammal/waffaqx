
import 'package:flutter/cupertino.dart';
import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/constants/constantsDimens.dart';


class SideTitle extends StatelessWidget {
  const SideTitle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(
          color: blackColor,
          fontSize: size18,
        ),
      ),
    );
  }
}
