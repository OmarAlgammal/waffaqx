

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/mobile_covers_compatibilities_cubit/mobile_covers_compatibilities_state.dart';

class MobileCoversCompatibilitiesCubit extends Cubit<MobileCoversCompatibilitiesState>{

  final CompatibilitiesUseCases _compatibilitiesUseCases;
  MobileCoversCompatibilitiesCubit(this._compatibilitiesUseCases) : super(MobileCoversCompatibilitiesInitialState());


  void loadMobileCoversCompatibilities({required String mobileId}) async {

    emit(MobileCoversCompatibilitiesLoadInProgress());
    await _compatibilitiesUseCases
        .getCoversCompatibilities(mobileId: mobileId)
        .then((mobilesWithThemeModel) {
      emit(MobileCoversCompatibilitiesLoadSuccess(mobilesWithThemeModel));
    }).catchError((error, stackTrack){
      emit(MobileCoversCompatibilitiesLoadFailure(error));
    });
  }

}