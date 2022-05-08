

import 'package:wafaq_x/data/data_source/firebase_data_source.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/domain/repos/mobiles_repository.dart';

class MobilesRepositoryImpl extends MobilesRepository{

  FirebaseDataSource _mobilesDataSource;

  MobilesRepositoryImpl(this._mobilesDataSource);

  @override
  Future<void> addMobile({required MobileModel mobileModel}) async{
    await _mobilesDataSource.addMobile(mobileModel: mobileModel);
  }

  @override
  Future<List<MobileModel>> getAllMobiles() async{
    return await _mobilesDataSource.getAllMobiles();
  }

  @override
  Future<MobileModel> getMobile({required String mobileId}) async{
    return await _mobilesDataSource.getMobile(docId: mobileId);
  }

}