

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/delete_comp_cubit/delete_comp_state.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/services/firestore_sevices.dart';
import 'package:wafaq_x/utilities/constants/texts/api.dart';

class DeleteCompCubit extends Cubit<DeleteCompState>{
  DeleteCompCubit() : super(DeleteCompInitialState());

  FirestoreServices _fireStoreServices = FirestoreServices.instance;


  Future<void> deleteComp({required List<MobileModel> comp, required int index}) async{
    await _fireStoreServices.deleteData(path: '$coversPath${comp.first.mobileId}',);
    comp.removeAt(index);
    if (comp.length == 1)
      return;

    List<Map<String, dynamic>> newComp = [];
    for (final mobile in comp){
      newComp.add(mobile.toJson());
    }
    await _fireStoreServices.setData(path: '$coversPath${newComp.first[mobileIdParameter]}', map: {compParameter: newComp});
  }

}