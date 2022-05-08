
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/domain/use_cases/mobiles_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/add_mobile_cubit/add_mobile_state.dart';

class AddMobileCubit extends Cubit<AddMobileState>{

  final MobilesUseCases _mobilesUseCases;
  AddMobileCubit(this._mobilesUseCases) : super(AddingMobileInitialState());


  Future<void> addMobile({required MobileModel mobile}) async{
    emit(AddingMobileInProgress());
    await _mobilesUseCases.addMobile(mobileModel: mobile).then((value){
      emit(MobileAddedSuccessfully());
    }).catchError((error, stackTrace){
      emit(AddingMobileFailure());
    });
  }


}