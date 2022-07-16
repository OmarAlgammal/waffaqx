
import 'package:equatable/equatable.dart';

abstract class AddMobileState extends Equatable{}

class AddMobileInitialState extends AddMobileState{
  @override
  List<Object?> get props => [];
}

class AddingMobile extends AddMobileState{
  @override
  List<Object?> get props => [];
}

class MobileAddedSuccessfully extends AddMobileState{
  @override
  List<Object?> get props => [];
}

class FailedToAddMobile extends AddMobileState{
  @override
  List<Object?> get props => [];
}