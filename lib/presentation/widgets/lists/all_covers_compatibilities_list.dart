import 'package:flutter/material.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/all_covers_compatibilties_item_design.dart';
import 'package:wafaq_x/presentation/widgets/dividers/thickDivider.dart';

import '../../../utilities/constants/constantsDimens.dart';

class AllCoversCompatibilitiesList extends StatelessWidget {
  const AllCoversCompatibilitiesList({Key? key, required this.allCompatibilities}) : super(key: key);

  final List<List<MobileWithThemeModel>> allCompatibilities;


  @override
  Widget build(BuildContext context) {
    List<MobileWithThemeModel> mobilesWithTheme;
    return ListView.builder(
      itemCount: allCompatibilities.length,
      itemBuilder: (context, myIndex){
        mobilesWithTheme = allCompatibilities[myIndex];
        return Column(
          children: [
            gap8,
            ListView.builder(
              itemCount: mobilesWithTheme.length,
              shrinkWrap: true,
              physics: const  NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                print('mobiles with theme is ${mobilesWithTheme.length}');
                return AllCoversCompatibilitiesListItemDesign(mobileWithTheme: mobilesWithTheme[index], onPressed: (){},);
              },
            ),
            gap8,
            Visibility(
              visible: (myIndex == allCompatibilities.length -1)? false : true,
              child: const ThickDivider(),
            )
          ],
        );
      },
    );
  }
}
