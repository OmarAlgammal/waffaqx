
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';

abstract class ScreensCompatibilitiesState{}

class ScreensCompatibilitiesInitialState extends ScreensCompatibilitiesState{}

class ScreensCompatibilitiesLoadSuccess extends ScreensCompatibilitiesState{
  final List<MobileWithThemeModel> mobilesWithTheme;
  ScreensCompatibilitiesLoadSuccess(this.mobilesWithTheme);
}

class ScreensCompatibilitiesLoadInProgress extends ScreensCompatibilitiesState{}

class ScreensCompatibilitiesLoadFailure extends ScreensCompatibilitiesState{
  final String error;
  ScreensCompatibilitiesLoadFailure(this.error);
}
