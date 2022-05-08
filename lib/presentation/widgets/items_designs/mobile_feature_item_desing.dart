
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';

class MobileFeatureDetermination extends StatelessWidget {
  const MobileFeatureDetermination({Key? key, required this.mobileFeature, required this.description, this.features, required this.brandColor}) : super(key: key);

  final String mobileFeature;
  final List<String>? features;
  final List<String> description;
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
              padding: padding8,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: description.length,
                itemBuilder: (context, index){
                  return  Column(
                    children: [
                      gap2,
                      Row(
                        children: [
                          Visibility(
                            visible: (description.length > 1)? true: false,
                            child: Row(
                              children: [
                                Container(
                                  width: size8,
                                  height: size8,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: whiteColor
                                  ),
                                ),
                                gap8,
                              ],
                            ),
                          ),
                          Text(
                            (features == null)? '': features![index],
                            style: const TextStyle(
                              color: whiteColor,
                            ),
                          ),
                          gap8,
                          Expanded(
                            flex: 1,
                            child: Text(
                              description[index],
                              style: const TextStyle(
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      gap2,
                      Visibility(
                        visible: (description.length -1 == index)?  false: true,
                        child: const SkinnyDivider(),
                      )
                    ],
                  );
                },
              ),
            )
          )
        ],
      )
    );
  }
}
