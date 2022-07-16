import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_event.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_state.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/services/firestore_sevices.dart';
import 'package:wafaq_x/utilities/constants/texts/api.dart';
import 'package:wafaq_x/utilities/helper/mobiles_filtration_helper.dart';

class MobilesBloc extends Bloc<MobilesEvent, MobilesState> {
  MobilesBloc() : super(MobilesInitialState()) {
    on<LoadMobiles>(_allMobiles);
    on<LoadBrandMobiles>(_brandMobiles);
  }

  FirestoreServices _fireStoreServices = FirestoreServices.instance;
  MobilesFiltrationHelper _filtrationHelper = MobilesFiltrationHelper();

  void _allMobiles(LoadMobiles loadMobiles, Emitter<MobilesState> emit) async{
    emit(MobilesLoading());

    Stream<List<MobileModel>> stream = _fireStoreServices.collectionStream(
        path: mobilesPath,
        builder: (map) {
          return MobileModel.fromJson(map!);
        },);

    await emit.forEach(stream, onData: (List<MobileModel> mobiles) {
      final mobilesWithThemeInOrder =
      _filtrationHelper.getMobilesArrangementWithTheme(mobiles);
      return MobilesLoadedSuccessfully(
          mobilesWithTheme: mobilesWithThemeInOrder);
    }).catchError((error) {
      emit(MobilesLoadedFailed());
    });
  }

  void _brandMobiles(LoadBrandMobiles brandMobiles, Emitter<MobilesState> emit) async {
    emit(MobilesLoading());

    Stream<List<MobileModel>> stream = _fireStoreServices.collectionStream(
        path: mobilesPath,
        builder: (map) {
          return MobileModel.fromJson(map!);
        }, queryBuilder: (query) => query.where(brandNameParameter, isEqualTo: brandMobiles.brandName));

    await emit.forEach(stream, onData: (List<MobileModel> mobiles) {
      final mobilesWithThemeInOrder =
          _filtrationHelper.getMobilesArrangementWithTheme(mobiles);
      return BrandMobilesLoadSuccessfully(
          mobilesWithTheme: mobilesWithThemeInOrder);
    }).catchError((error) {
      emit(MobilesLoadedFailed());
    });
  }

}
