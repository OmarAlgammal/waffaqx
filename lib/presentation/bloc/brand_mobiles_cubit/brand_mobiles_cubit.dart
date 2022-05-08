
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/brand_mobiles_cubit/brand_mobiles_states.dart';

class BrandMobilesCubit extends Cubit<BrandMobilesState>{

  final CompatibilitiesUseCases _compatibilitiesUseCases;

  BrandMobilesCubit(this._compatibilitiesUseCases) : super(BrandMobilesInitialState());

  loadBrandMobiles({required String brandName}) async{
    emit(BrandMobilesLoadInProgress());
    await _compatibilitiesUseCases.getBrandMobiles(brandName: brandName).then((mobilesWithTheme) {
      emit(BrandMobilesLoadSuccess(mobilesWithTheme));
    }).catchError((error, stackTrack){
      emit(BrandMobilesLoadFailure(error));
    });

  }

}