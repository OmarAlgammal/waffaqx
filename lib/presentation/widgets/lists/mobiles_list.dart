import 'package:flutter/material.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/mobile_item_design.dart';
import 'package:wafaq_x/utilities/constants/constantsDimens.dart';

class MobilesList extends StatelessWidget {
  const MobilesList({Key? key, required this.mobilesWithTheme})
      : super(key: key);

  final List<MobileWithThemeModel> mobilesWithTheme;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: mobilesWithTheme.length,
      itemBuilder: (context, index) {
        return MobileItemDesign(
          mobileWithTheme: mobilesWithTheme[index],
        );
      },
    );
  }
}
