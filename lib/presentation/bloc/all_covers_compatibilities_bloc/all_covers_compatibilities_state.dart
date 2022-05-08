
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';

abstract class CoversCompatibilitiesState{}

class CoversCompatibilitiesInitialState extends CoversCompatibilitiesState{}

class CoversCompatibilitiesLoadInProgress extends CoversCompatibilitiesState{}

class CoversCompatibilitiesLoadSuccessfully extends CoversCompatibilitiesState{
  final List<List<MobileWithThemeModel>> allCompatibilities;
  CoversCompatibilitiesLoadSuccessfully(this.allCompatibilities);
}

class CoversCompatibilitiesLoadFailure extends CoversCompatibilitiesState{
  final String error;
  CoversCompatibilitiesLoadFailure(this.error);
}










