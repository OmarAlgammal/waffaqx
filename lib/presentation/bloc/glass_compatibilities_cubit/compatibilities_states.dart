

import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';

abstract class GlassCompatibilitiesState {}


class GlassCompatibilitiesInitialState extends GlassCompatibilitiesState{}

class GlassCompatibilitiesLoadSuccess extends GlassCompatibilitiesInitialState{
  final List<MobileWithThemeModel> mobilesWithTheme;
  GlassCompatibilitiesLoadSuccess(this.mobilesWithTheme);
}

class GlassCompatibilitiesLoadInProgress extends GlassCompatibilitiesInitialState{}

class GlassCompatibilitiesLoadFailure extends GlassCompatibilitiesInitialState{
  final String error;
  GlassCompatibilitiesLoadFailure(this.error);
}

