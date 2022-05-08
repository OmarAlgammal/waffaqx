


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/glass_compatibilities_cubit/compatibilities_states.dart';

class GlassCompatibilitiesCubit extends Cubit<GlassCompatibilitiesState>{

  final CompatibilitiesUseCases _compatibilitiesUseCases;

  GlassCompatibilitiesCubit(this._compatibilitiesUseCases) : super(GlassCompatibilitiesInitialState());


  void loadGlassCompatibilities({required MobileModel requiredMobile}) async{
    emit(GlassCompatibilitiesLoadInProgress());
    await _compatibilitiesUseCases.getGlassCompatibilities(mobile: requiredMobile).then((mobilesWithTheme) {
      emit(GlassCompatibilitiesLoadSuccess(mobilesWithTheme));
    }).catchError((error, stackTrack){
      emit(GlassCompatibilitiesLoadFailure(error));
    });

  }
}