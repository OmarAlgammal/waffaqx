

import 'package:wafaq_x/data/entities/mobile_model.dart';

abstract class MobilesRepository {

  Future<void> addMobile({required MobileModel mobileModel});

  Future<List<MobileModel>> getAllMobiles();

  Future<MobileModel> getMobile({required String mobileId});

}