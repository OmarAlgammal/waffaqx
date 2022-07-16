
import 'package:equatable/equatable.dart';

abstract class DeleteCompState extends Equatable{}

class DeleteCompInitialState extends DeleteCompState{
  @override
  List<Object?> get props => [];
}

class DeletingComp extends DeleteCompState{
  @override
  List<Object?> get props => [];
}

class CompDeletedSuccessfully extends DeleteCompState{

  List<Object?> get props => [];

}

class DeletingCompFailed extends DeleteCompState{
  @override
  List<Object?> get props => [];

}