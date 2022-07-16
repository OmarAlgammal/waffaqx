
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/add_mobile_cubit/add_mobile_states.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/services/firestore_sevices.dart';
import 'package:wafaq_x/utilities/constants/texts/api.dart';

class AddMobileCubit extends Cubit<AddMobileState>{

  FirestoreServices fireStoreServices = FirestoreServices.instance;
  AddMobileCubit() : super(AddMobileInitialState());


  Future<void> addMobile({required MobileModel mobileModel}) async{
    emit(AddingMobile());
    try{
      await fireStoreServices.setData(path: '$mobilesPath${mobileModel.mobileId}', map: mobileModel.toJson());
      emit(MobileAddedSuccessfully());
    }catch(e){
      emit(FailedToAddMobile());
    }
  }

}