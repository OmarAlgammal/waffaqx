


import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/domain/repos/mobiles_repository.dart';
import 'package:wafaq_x/presentation/helper/mobiles_filtration_helper.dart';

class MobilesUseCases{

  final MobilesRepository _mobilesRepository;
  final MobilesFiltrationHelper _mobilesFiltrationHelper = MobilesFiltrationHelper();

  MobilesUseCases(this._mobilesRepository);


  Future<void> addMobile({required MobileModel mobileModel}) async{
    return await _mobilesRepository.addMobile(mobileModel: mobileModel);
  }

  Future<List<MobileWithThemeModel>> getAllMobiles() async{
     return await _mobilesRepository.getAllMobiles().then((mobiles) {
      return _mobilesFiltrationHelper.getMobilesArrangementWithTheme(mobiles: mobiles);
    });
  }

}