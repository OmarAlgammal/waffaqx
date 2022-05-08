
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/domain/use_cases/mobiles_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/all_mobiles_cubit/all_mobiles_state.dart';

class AllMobilesCubit extends Cubit<AllMobilesState>{
  final MobilesUseCases _mobilesUseCases;

  AllMobilesCubit(this._mobilesUseCases) : super(AllMobilesInitialState());


  void loadAllMobiles() async{
    emit(AllMobilesLoadInProgress());
    await _mobilesUseCases.getAllMobiles().then((mobilesWithThemeModel) {
      emit(AllMobilesLoadSuccess(mobilesWithThemeModel));
    }).catchError((error, stackTrack){
      emit(AllMobilesLoadFailure(error));
    });
  }

}