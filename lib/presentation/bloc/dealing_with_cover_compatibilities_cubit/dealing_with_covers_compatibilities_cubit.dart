
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/dealing_with_cover_compatibilities_cubit/dealing_with_covers_compatibilities_state.dart';


class DealingWithCoversCompatibilitiesCubit extends Cubit<DealingWithCoversCompatibilitiesState>{
  final CompatibilitiesUseCases _compatibilitiesUseCases;

  DealingWithCoversCompatibilitiesCubit(this._compatibilitiesUseCases) : super(DealingWithCoversCompatibilitiesInitialState());

  Future<void> addCoversCompatibility({required MobileModel firstMobile, required MobileModel secondMobile}) async{
    emit(DealingWithCoversCompatibilitiesLoadInProgress());
    await _compatibilitiesUseCases.addCoversCompatibility(firstMobile: firstMobile, secondMobile: secondMobile).then((value){
      emit(CompatibilitiesAddedSuccessfully());
    }).catchError((error, stackTrack){
      emit(DealingWithCoversCompatibilitiesFailed());
    });
  }

  Future<void> deleteCoversCompatibilities({required List<MobileWithThemeModel> mobilesWithTheme, required int index}) async{
    emit(DealingWithCoversCompatibilitiesLoadInProgress());
    await _compatibilitiesUseCases.deleteCoverFromCompatibilities(mobilesWithTheme: mobilesWithTheme, index: index).then((value) => emit(CompatibilitiesDeletedSuccessfully()))
        .catchError((error, stackTrack){
          emit(DealingWithCoversCompatibilitiesFailed());
    });
  }

}