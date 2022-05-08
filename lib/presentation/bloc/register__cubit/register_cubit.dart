

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/domain/use_cases/admins_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_state.dart';


class RegisterCubit extends Cubit<RegisterState>{

  final AdminsUseCases _adminsUseCases;

  RegisterCubit(this._adminsUseCases) : super(RegisterInitialState());

  void  whoIsSignedIn() async{
    String result = _adminsUseCases.whoIsSignedIn();
    if (result == 'user'){
      emit(UserSignedInSuccessfully());
    }else if (result == 'admin'){
      emit(AdminSignedInSuccessfully());
    }else{
      emit(NoOneRegisterYet());
    }

  }

  void singInAsAdmin({required String email, required String password}) async{
    emit(RegisterInProgress());
    await _adminsUseCases.signInAsAdmin(email: email, password: password).then((value){
      return emit(AdminSignedInSuccessfully());
    }).catchError((error, stackTrack){
      return emit(RegisterFailure());
    });
  }

  void singInAsUser() async{
    emit(RegisterInProgress());
    await _adminsUseCases.signInAsUser().then((value) => emit(UserSignedInSuccessfully()))
        .catchError((error, stackTrack) => emit(RegisterFailure()));
  }

  void singOut() async{
    emit(RegisterInProgress());
    await _adminsUseCases.singOut().then((value){
      emit(SignedOutSuccessfully());
    }).catchError((error, stackTrack){
      emit(RegisterFailure());
    });
  }
}