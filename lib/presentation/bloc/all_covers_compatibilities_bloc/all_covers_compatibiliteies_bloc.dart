
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/all_covers_compatibilities_bloc/all_covers_compatibilities_event.dart';
import 'package:wafaq_x/presentation/bloc/all_covers_compatibilities_bloc/all_covers_compatibilities_state.dart';

class AllCoversCompatibilitiesBloc extends Bloc<CoversCompatibilitiesEvent, CoversCompatibilitiesState>{


  final CompatibilitiesUseCases _compatibilitiesUseCases;

  AllCoversCompatibilitiesBloc(this._compatibilitiesUseCases) : super(CoversCompatibilitiesInitialState()){
    on<LoadCoversCompatibilities>(_onLoadCoversCompatibilities);
  }

  void _onLoadCoversCompatibilities(LoadCoversCompatibilities event, Emitter<CoversCompatibilitiesState> emit) async{
    emit(CoversCompatibilitiesLoadInProgress());
    await emit.forEach(_compatibilitiesUseCases.getAllCoversCompatibilities(), onData: (List<List<MobileWithThemeModel>> mobilesWithTheme){
      return CoversCompatibilitiesLoadSuccessfully(mobilesWithTheme);
    }).catchError((error, stackTrace) {
      emit(CoversCompatibilitiesLoadFailure(error.toString()));
    });
  }
}