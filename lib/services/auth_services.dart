import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wafaq_x/models/admin_model/admin_model.dart';
import 'package:wafaq_x/utilities/constants/texts/api.dart';
import 'package:wafaq_x/utilities/enums/authenticators.dart';

class AuthServices{

  AuthServices._();
  static final instance = AuthServices._();

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  final _fireStore = FirebaseFirestore.instance;
  GetStorage _getStorage = GetStorage();

  Future<void> setAdmin({required String path, required Map<String, dynamic> map}) async{
    final reference = _fireStore.collection(adminPath).doc(path);
    await reference.set(map);
  }

  Future<void> removeAdmin({required String path}) async{
    final reference = _fireStore.doc(path);
    await reference.delete();
  }

  Future<bool> loginAsAdmin({required String email, required String password}) async{
    final reference = fireStore.collection(adminPath);
    final allDocs = await reference.get();

    List<bool> result = allDocs.docs.map((snapshot) {
      final admin = AdminModel.fromJson(snapshot.data());
      if (admin.email == email && admin.password == password){
        return true;
      }
      return false;
    }).toList();

    if (result.contains(true))
      return true;

    return false;
  }


  Future<void> loginAsAdminLocally({required String email, required String password}) async{
    await _getStorage.write(Authenticators.admin.name, {'email': email, 'password': password});
  }

  Future<void> loginAsUserLocally() async{
    await _getStorage.write(Authenticators.user.name, true);
  }
  
  bool adminIsLogin(){
    final admin = _getStorage.read(Authenticators.admin.name);

    if (admin != null)
      return true;
    return false;
  }

  dynamic getUserFromLocalStorage({required String userType}){
    return _getStorage.read(userType);
  }

  /// delete any user data from local storage
  Future<void> logout() async{
    await _getStorage.erase();
  }

}