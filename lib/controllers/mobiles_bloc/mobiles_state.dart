import 'package:equatable/equatable.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';

import '../../models/requiredMobileModel.dart';

abstract class MobilesState {}

class MobilesInitialState extends MobilesState {}

class MobilesLoading extends MobilesState {}

class MobilesLoadedSuccessfully extends MobilesState {
  final List<MobileWithThemeModel> mobilesWithTheme;
  MobilesLoadedSuccessfully({required this.mobilesWithTheme});
}

class BrandMobilesLoadSuccessfully extends MobilesState{
  final List<MobileWithThemeModel> mobilesWithTheme;
  BrandMobilesLoadSuccessfully({required this.mobilesWithTheme});
}

class MobilesLoadedFailed extends MobilesState {}
