
import 'package:flutter/cupertino.dart';
import '../constants/constantsDimens.dart';


extension RoundedCornerExtension on Widget{

  Widget roundedCorner({required Color color}){

    return Container(
      height: size56,
      child: Padding(
        padding: paddingH8,
        child: this,
      ),
      decoration: BoxDecoration(
        borderRadius: circular12,
        color: color,
      ),
    );
}
}
