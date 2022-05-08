
import 'package:equatable/equatable.dart';

abstract class AddMobileState extends Equatable{}


class AddingMobileInitialState extends AddMobileState{
  @override
  List<Object?> get props => ['Adding Mobile Initial State'];
}

class AddingMobileInProgress extends AddMobileState{
  @override
  List<Object?> get props => ['Adding Mobile In Progress'];
}

class MobileAddedSuccessfully extends AddMobileState{
  @override
  List<Object?> get props => ['Mobile Added Successfully'];
}

class AddingMobileFailure extends AddMobileState{
  @override
  List<Object?> get props => ['Adding Mobile Failure'];
}