
import 'package:equatable/equatable.dart';

abstract class SetAdminState extends Equatable{}


class SetAdminInitialState extends SetAdminState{
  @override
  List<Object?> get props => [];
}

class SetAdminInProgress extends SetAdminState{
  @override
  List<Object?> get props => [];
}

class AdminAddedSuccessfully extends SetAdminState{
  @override
  List<Object?> get props => [];
}

class FailedToAddAdmin extends SetAdminState{
  @override
  List<Object?> get props => [];
}