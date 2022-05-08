
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/entities/admin_model/admin_model.dart';
import 'package:wafaq_x/domain/use_cases/admins_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/set_admin_cubit/set_admin_state.dart';

class SetAdminCubit extends Cubit<SetAdminState>{

  final AdminsUseCases _adminsUseCases;
  SetAdminCubit(this._adminsUseCases) : super(SetAdminInitialState());



  Future<void> setAdmin({required AdminModel adminModel}) async{
    await _adminsUseCases.setAdmin(adminModel: adminModel).then((value) => emit(AdminSetSuccessfully()))
        .catchError((error, stackTrack) => emit(SetAdminFailure()));
  }

}