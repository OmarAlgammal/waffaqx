
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/add_cover_compatibilities_cubit/add_cover_comp_state.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/services/firestore_sevices.dart';

import '../../utilities/constants/texts/api.dart';

class AddCoverCompCubit extends Cubit<AddCoverCompState>{
  AddCoverCompCubit() : super(AddCoverCompInitialState());

  FirestoreServices _fireStore = FirestoreServices.instance;

  Future<void> addCoverComp({required MobileModel firstMobile, required secondMobile}) async{
    emit(AddingCoverComp());
    try{
      final listOfList = await _fireStore.futureCollection(path: coversPath, builder: (map) => map[compParameter]);

      debugPrint('list of list is ${listOfList.toString()}');

      List<bool> listOfBool = [];
      for (final list in listOfList){
        for (final map in list){
          if (map[mobileIdParameter] == firstMobile.mobileId || map[mobileIdParameter] == secondMobile.mobileId){
            listOfBool.add(true);
          }
        }

        /// if there is any mobile is exist in more than one list return error
        if (listOfBool.length > 1){
          return emit(AddingCoverCompFailed());
        }
      }

      /// get comps list with two mobiles
      List<Map<String, dynamic>> maps = [];
      for (final list in listOfList){
        debugPrint('we are here num one');
        for (final map in list){
          debugPrint('we are here num two');
          if (map[mobileIdParameter] == firstMobile.mobileId || map[mobileIdParameter] == secondMobile.mobileId){
            debugPrint('map inside for loop ${list.toString()}');
            maps = list.cast<Map<String, dynamic>>();
            break;
          }
        }
      }

      /// if there is no comps
      if (maps.isEmpty){
        debugPrint('list length is zero');
        Map<String, dynamic> map = {compParameter: [firstMobile.toJson(), secondMobile.toJson()]};
        debugPrint('here num two');
        await _fireStore.setData(path: '$coversPath${firstMobile.mobileId}', map: map);
         return emit(CoverCompAddingSuccessfully());
      }

      /// add mobile to it's comps
      for (final map in maps){
        if (map[mobileIdParameter] == firstMobile.mobileId){
          maps.add(secondMobile.toJson());
          break;
        }
        if (map[mobileIdParameter] == secondMobile.mobileId){
          maps.add(firstMobile.toJson());
          break;
        }
      }

      Map<String, dynamic> map = {compParameter: maps};
      await _fireStore.setData(path: '$coversPath${maps.first[mobileIdParameter]}', map: map);
      emit(CoverCompAddingSuccessfully());
    }
    catch(e){
      emit(AddingCoverCompFailed());
    }
  }
}