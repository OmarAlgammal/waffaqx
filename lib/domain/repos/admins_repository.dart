
import 'package:wafaq_x/data/entities/admin_model/admin_model.dart';

abstract class AdminsRepository{

  bool isUserSignedIn();

  bool isAdminSignedIn();

  Future<bool> logInAsAdmin({required String email, required String password});

  Future<void> logInAsUser();

  Future<void> signOut();

  Future<List<AdminModel>> getAdmins();

  Future setAdmin({required AdminModel adminModel});

  Future<void> saveUserSingInData();

  Future<void> saveAdminSingInData();

}