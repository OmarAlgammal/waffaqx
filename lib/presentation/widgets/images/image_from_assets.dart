import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageFromAssets extends StatelessWidget {
  const ImageFromAssets({Key? key, required this.path, this.color})
      : super(key: key);

  final String path;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      color: color,
    );
  }
}
