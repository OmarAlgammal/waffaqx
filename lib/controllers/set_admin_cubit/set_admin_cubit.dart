
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/set_admin_cubit/set_admin_state.dart';
import 'package:wafaq_x/models/admin_model/admin_model.dart';
import 'package:wafaq_x/services/firestore_sevices.dart';
import 'package:wafaq_x/utilities/constants/texts/api.dart';

class SetAdminCubit extends Cubit<SetAdminState>{
  SetAdminCubit() : super(SetAdminInitialState());

  FirestoreServices _fireStoreServices = FirestoreServices.instance;

  Future<void> setAdmin({required AdminModel adminModel}) async{
    emit(SetAdminInProgress());
    try{
      await _fireStoreServices.setData(path:'$adminPath${adminModel.name}' , map: adminModel.toJson());
      emit(AdminAddedSuccessfully());
    }
    catch(e){
      emit(FailedToAddAdmin());
    }
  }
}