
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';

abstract class AllMobilesState{}

class AllMobilesInitialState extends AllMobilesState{}

class AllMobilesLoadInProgress extends AllMobilesState{}

class AllMobilesLoadFailure extends AllMobilesState{
  final String error;
  AllMobilesLoadFailure(this.error);
}

class AllMobilesLoadSuccess extends AllMobilesState{
  final List<MobileWithThemeModel> mobilesWithThemeModel;
  AllMobilesLoadSuccess(this.mobilesWithThemeModel);
}