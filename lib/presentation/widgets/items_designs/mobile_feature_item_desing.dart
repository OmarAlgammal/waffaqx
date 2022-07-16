
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';

import '../../../utilities/constants/constantsColors.dart';
import '../../../utilities/constants/constantsDimens.dart';

class MobileFeatureDetermination extends StatelessWidget {
  const MobileFeatureDetermination({Key? key, required this.mobileFeature, required this.description, required this.brandColor}) : super(key: key);

  final String mobileFeature;
  final String description;
  final Color brandColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          SideTitle(title: mobileFeature),
          Container(
            decoration: BoxDecoration(
              color: brandColor,
              borderRadius: const BorderRadius.all(Radius.circular(size12)),
            ),
            child:
            Padding(
              padding: EdgeInsets.fromLTRB(size8, size16, size8, size16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      description,
                      style: const TextStyle(
                        color: whiteColor,
                        fontSize: size16,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          gap4,
        ],
      )
    );
  }
}
