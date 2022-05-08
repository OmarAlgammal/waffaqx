
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, this.title, required this.onPressed}) : super(key: key);

  final String? title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: const Size.fromHeight(size56),
        backgroundColor: brightGrayColor,
        shape: const RoundedRectangleBorder(
          borderRadius: circular12,
        )
      ),
    onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            title?? searchHintText,
            style: const TextStyle(fontSize: size16, color: grayColor,),
            textDirection: TextDirection.ltr,
          ),
        ),
    );
  }
}
