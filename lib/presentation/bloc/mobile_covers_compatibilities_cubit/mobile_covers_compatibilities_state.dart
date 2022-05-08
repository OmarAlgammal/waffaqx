

import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';

abstract class MobileCoversCompatibilitiesState{}

class MobileCoversCompatibilitiesInitialState extends MobileCoversCompatibilitiesState{}

class MobileCoversCompatibilitiesLoadInProgress extends MobileCoversCompatibilitiesState{}

class MobileCoversCompatibilitiesLoadSuccess extends MobileCoversCompatibilitiesState{
  final List<MobileWithThemeModel> mobilesWithThemeModel;
  MobileCoversCompatibilitiesLoadSuccess(this.mobilesWithThemeModel);
}

class MobileCoversCompatibilitiesLoadFailure extends MobileCoversCompatibilitiesState{
  final String error;
  MobileCoversCompatibilitiesLoadFailure(this.error);
}

