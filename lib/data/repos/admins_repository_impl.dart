
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/data/data_source/firebase_data_source.dart';
import 'package:wafaq_x/data/data_source/local_data_source.dart';
import 'package:wafaq_x/data/entities/admin_model/admin_model.dart';
import 'package:wafaq_x/domain/repos/admins_repository.dart';

class AdminsRepositoryImpl extends AdminsRepository{

  final FirebaseDataSource _firebaseDataSource;
  final LocalDataSource _localDataSource;

  AdminsRepositoryImpl(this._firebaseDataSource, this._localDataSource);

  @override
  bool isUserSignedIn() {
    return _localDataSource.isUserSignedIn();
  }

  @override
  bool isAdminSignedIn() {
    return _localDataSource.isAdminSignedIn();
  }

  @override
  Future<bool> logInAsAdmin({required String email, required String password}) async{
    return await _firebaseDataSource.adminLogin(email: email, password: password);
  }

  @override
  Future<void> logInAsUser() async{
    await _localDataSource.saveUserSignInData();
  }

  @override
  Future<void> signOut() async{
    await _localDataSource.signOut();
  }

  @override
  Future<List<AdminModel>> getAdmins() async{
    return await _firebaseDataSource.getAdmins();
  }

  @override
  Future<void> setAdmin({required AdminModel adminModel}) async{
    await _firebaseDataSource.setAdmin(adminModel: adminModel);
  }

  @override
  Future<void> saveUserSingInData() async{
    return await _localDataSource.saveUserSignInData();
  }

  @override
  Future<void> saveAdminSingInData() async{
    return await _localDataSource.saveAdminSignInData();
  }
}