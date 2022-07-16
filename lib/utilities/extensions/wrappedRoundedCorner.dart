import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/constantsDimens.dart';


extension WrappedRoundedCorner on Widget {
  Widget wrappedRoundedCorner({required Color brandColor}) {
    return Row(
      children: [
        Container(
          child: Padding(
            padding: padding12,
            child: SizedBox(
              height: 36,
              child: Center(child: this,),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: circular12,
            color: brandColor,
          ),
        ),
      ],
    );
  }
}
