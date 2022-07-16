
import 'package:flutter/material.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/compatibilities_item_design.dart';

class CompatibilitiesList extends StatelessWidget {
  const CompatibilitiesList({Key? key, required this.mobilesWithTheme}) : super(key: key);

  final List<MobileWithThemeModel> mobilesWithTheme;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mobilesWithTheme.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return CompatibilitiesListItemDesign(mobileWithTheme: mobilesWithTheme[index]);
      },
    );
  }
}
