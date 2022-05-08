
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';

abstract class BrandMobilesState{}

class BrandMobilesInitialState extends BrandMobilesState{}

class BrandMobilesLoadInProgress extends BrandMobilesState{}

class BrandMobilesLoadSuccess extends BrandMobilesState{
  final List<MobileWithThemeModel> mobilesWithTheme;

  BrandMobilesLoadSuccess(this.mobilesWithTheme);
}

class BrandMobilesLoadFailure extends BrandMobilesState{
  final String error;
  BrandMobilesLoadFailure(this.error);
}