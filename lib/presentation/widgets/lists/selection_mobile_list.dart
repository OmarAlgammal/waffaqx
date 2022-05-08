

import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/selection_mobile_item_design.dart';

class SelectionMobileList extends StatelessWidget {
  const SelectionMobileList({Key? key, required this.mobilesWithTheme}) : super(key: key);

  final List<MobileWithThemeModel> mobilesWithTheme;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mobilesWithTheme.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return SelectionMobileItemDesign(mobileWithTheme: mobilesWithTheme[index]);
      },
    );
  }
}
