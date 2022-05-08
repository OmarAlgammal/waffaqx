
import 'package:equatable/equatable.dart';

abstract class DealingWithCoversCompatibilitiesState extends Equatable{}

class DealingWithCoversCompatibilitiesInitialState extends DealingWithCoversCompatibilitiesState{
  @override
  List<Object?> get props => ['Dealing With Covers Compatibilities'];

}

class DealingWithCoversCompatibilitiesLoadInProgress extends DealingWithCoversCompatibilitiesState{
  @override
  List<Object?> get props => ['Dealing With Covers Compatibilities'];
}

class CompatibilitiesAddedSuccessfully extends DealingWithCoversCompatibilitiesState{
  @override
  List<Object?> get props => ['Compatibilities Added Successfully'];
}

class CompatibilitiesDeletedSuccessfully extends DealingWithCoversCompatibilitiesState{
  @override
  List<Object?> get props => ['Compatibilities Deleted Successfully'];
}


class DealingWithCoversCompatibilitiesFailed extends DealingWithCoversCompatibilitiesState{
  @override
  List<Object?> get props => ['Dealing With Covers Compatibilities Failed'];

}
