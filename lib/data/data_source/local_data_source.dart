

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LocalDataSource{
  final localStorage = GetStorage();

  bool isUserSignedIn(){
    var result = localStorage.read<bool>('user');
    print('is user singed in $result');
    return result?? false;
  }

  bool isAdminSignedIn(){
    var result = localStorage.read<bool>('admin');
    return result?? false;
  }

  Future<void> saveUserSignInData() async{
    await localStorage.write('user', true);
  }

  Future<void> saveAdminSignInData() async{
    await localStorage.write('admin', true);
  }

  Future<void> signOut() async{
    await localStorage.write('user', false);
    await localStorage.write('admin', false);
  }
}