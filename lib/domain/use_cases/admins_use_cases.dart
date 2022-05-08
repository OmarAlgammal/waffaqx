
import 'package:wafaq_x/data/entities/admin_model/admin_model.dart';
import 'package:wafaq_x/domain/repos/admins_repository.dart';

class AdminsUseCases{

  final AdminsRepository _adminsRepository;

  AdminsUseCases(this._adminsRepository);

  String whoIsSignedIn(){
    bool userResult = _adminsRepository.isUserSignedIn();
    bool adminResult = _adminsRepository.isAdminSignedIn();
    print('who is singed in $userResult and admin is $adminResult');
    if (!userResult && !adminResult){
      return 'noUser';
    }else if (userResult){
      return 'user';
    }
    else {
      return 'admin';
    }
  }

  Future<void> signInAsAdmin({required String email, required String password}) async{
    bool result  = await _adminsRepository.logInAsAdmin(email: email, password: password);
    if (result){
      await _adminsRepository.saveAdminSingInData();
    }else{
      throw UnimplementedError();
    }
  }

  Future<void> signInAsUser() async{
    await _adminsRepository.saveUserSingInData();
  }

  Future<void> singOut() async{
    await _adminsRepository.signOut();
  }

  Future <List<AdminModel>> getAdmins() async{
   return await _adminsRepository.getAdmins();
  }

  Future<void> setAdmin({required AdminModel adminModel}) async{
    return await _adminsRepository.setAdmin(adminModel: adminModel);
  }

}