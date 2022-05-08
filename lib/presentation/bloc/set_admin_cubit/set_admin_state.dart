

import 'package:equatable/equatable.dart';

abstract class SetAdminState extends Equatable{}


class SetAdminInitialState extends SetAdminState{
  @override
  List<Object?> get props => ['Set Admin Initial State'];
}

class AdminSetSuccessfully extends SetAdminState{
  @override
  List<Object?> get props => ['Admin Set Successfully'];
}

class SetAdminInProgress extends SetAdminState{
  @override
  List<Object?> get props => ['Set Admin In Progress'];
}

class SetAdminFailure extends SetAdminState{
  @override
  List<Object?> get props => ['Set Admin Failure'];
}