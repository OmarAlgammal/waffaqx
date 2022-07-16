
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/auth_cubit/log_state.dart';
import 'package:wafaq_x/services/auth_services.dart';
import 'package:wafaq_x/utilities/enums/authenticators.dart';

class LogCubit extends Cubit<LogState>{
  AuthServices authServices = AuthServices.instance;

  LogCubit() : super(InitialLogState());

  Future<void> isRegistered() async{
    emit(LogLoading());

    final admin = authServices.getUserFromLocalStorage(userType: Authenticators.admin.name);
    final userResult = authServices.getUserFromLocalStorage(userType: Authenticators.user.name);

    if (userResult != null && userResult){
      return emit(LogInSuccessfully(authenticators: Authenticators.user));
    }
    else if (admin != null){
      bool loginResult = await authServices.loginAsAdmin(email: admin['email'], password: admin['password']);
      if (loginResult)
        return emit(LogInSuccessfully(authenticators: Authenticators.admin));
      else
        return emit(LogFailed());
    }

    else
      return emit(NotRegisterYet());
  }

  Future<void> loginAsAdmin({required String email, required String password}) async{
    emit(LoggingIn());
    try{
      bool result = await authServices.loginAsAdmin(email: email, password: password);
      if (result){
        await authServices.loginAsAdminLocally(email: email, password: password);
        return emit(LogInSuccessfully(authenticators: Authenticators.admin));
      }
      return emit(LogFailed());
    }catch(e){
      return emit(LogFailed());
    }
  }

  Future<void> loginAsUser() async{
    emit(LoggingIn());
    try{
      await authServices.loginAsUserLocally();
      emit(LogInSuccessfully(authenticators: Authenticators.user));
    }catch(e){
      emit(LogFailed());
    }
  }

  Future<void> logout() async{
    emit(LoggingOut());
    try{
      await authServices.logout();
      return emit(LoggedOutSuccessfully());
    }catch(e){
      return emit(LogFailed());
    }
  }

}