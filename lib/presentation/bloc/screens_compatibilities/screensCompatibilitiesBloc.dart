
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/screens_compatibilities/screens_compatibilities_states.dart';

class ScreensCompatibilitiesCubit extends Cubit<ScreensCompatibilitiesState>{

  final CompatibilitiesUseCases _compatibilitiesUseCases;

  ScreensCompatibilitiesCubit(this._compatibilitiesUseCases) : super(ScreensCompatibilitiesInitialState());



  void loadScreensCompatibilities({required MobileModel requiredMobile}) async{
    emit(ScreensCompatibilitiesLoadInProgress());
    await _compatibilitiesUseCases.getScreenCompatibilities(mobile: requiredMobile).then((mobilesWithThemeModel) {
      emit(ScreensCompatibilitiesLoadSuccess(mobilesWithThemeModel));
    }).catchError((error, stackTrack){
      emit(ScreensCompatibilitiesLoadFailure(error));
    });

  }

}
