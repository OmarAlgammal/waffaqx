
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/compatibilities_controller.dart';
import 'package:wafaq_x/controllers/delete_comp_cubit/delete_comp_cubit.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/dividers/thickDivider.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/all_covers_compatibilties_item_design.dart';
import 'package:wafaq_x/presentation/widgets/lists/mobiles_list.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import 'package:wafaq_x/utilities/constants/constantsColors.dart';
import 'package:wafaq_x/utilities/helper/mobiles_filtration_helper.dart';

import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/texts.dart';

class AllCoversCompatibilitiesPage extends StatefulWidget {
  const AllCoversCompatibilitiesPage({Key? key}) : super(key: key);

  @override
  _AllCoversCompatibilitiesPageState createState() => _AllCoversCompatibilitiesPageState();
}

class _AllCoversCompatibilitiesPageState extends State<AllCoversCompatibilitiesPage> {

  CompatibilitiesController _compatibilitiesController = CompatibilitiesController();
  MobilesFiltrationHelper _filtrationHelper = MobilesFiltrationHelper();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          automaticallyImplyLeading: true,
          elevation: size0,
          title: const Text(
            coversCompatibilitiesText,
          ),
        ),
        body: Padding(
          padding: padding8,
          child: Center(
            child: displayList(),
          ),
        ),
      ),
    );
  }

  displayList(){
    debugPrint('here in all comps page');
    MobileModel m = MobileModel(
        brandName: 'brandName',
        mobileId: 'sss',
        mobileName: 'mobileName',
        displaySize: 4,
        processor: 'processor',
        storageAndRam: ['dfd'],
        mainCameras: ['df'],
        selfieCameras: ['dfa'],
        battery: 'battery',
        os: 'os',
        hasNotch: false);
    return StreamBuilder<List<List<MobileModel>>>(
      stream: _compatibilitiesController.allComp(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          debugPrint('snapshot here ${snapshot.data!.length}');
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loading();

          final data = snapshot.data!;

          if (data.isEmpty)
            return NoResultsFound();

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index){

              if (data[index].isEmpty)
                return SizedBox();

              final mobiles = data[index];
              return Column(
                children: [
                  gap16,
                  ListView.builder(
                    itemCount: mobiles.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return AllCoversCompatibilitiesListItemDesign(mobileWithTheme: _filtrationHelper.getMobileWithTheme(mobiles[index]), onPressed: (){
                        BlocProvider.of<DeleteCompCubit>(context).deleteComp(comp: mobiles, index: index);
                      },);
                    },
                  ),
                  gap16,
                  (index != data.length -1)? ThickDivider() : SizedBox(),
                ],
              );
            },
          );

        }else
          return NoResultsFound();
      },
    );
  }

}
