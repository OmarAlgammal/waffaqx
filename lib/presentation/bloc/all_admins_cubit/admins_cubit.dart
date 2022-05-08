
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/domain/use_cases/admins_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/all_admins_cubit/admins_state.dart';

class AllAdminsCubit extends Cubit<AdminsState>{

  final AdminsUseCases adminsUseCases;
  AllAdminsCubit({required this.adminsUseCases}) : super(AdminsLoadInProgress());

  void loadAdmins() async{
    emit(AdminsLoadInProgress());
    await adminsUseCases.getAdmins().then((admins) {
      return AdminsLoadSuccess(admins: admins);
    }).catchError((error, stackTrack){
      emit(AdminsLoadFailure());
    });
  }



}