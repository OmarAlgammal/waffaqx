

import 'package:equatable/equatable.dart';


abstract class RegisterState extends Equatable{}

class RegisterInitialState extends RegisterState{
  @override
  List<String> get props => ['Verification Initial State'];
}

class NoOneRegisterYet extends RegisterState{
  @override
  List<Object?> get props => ['User Has Not Register Yet'];
}

class RegisterInProgress extends RegisterState{
  @override
  List<Object?> get props => ['Verification In Progress'];
}

class UserSignedInSuccessfully extends RegisterState{
  @override
  List<Object?> get props => ['User Logged In Successfully'];
}

class AdminSignedInSuccessfully extends RegisterState{
  @override
  List<Object?> get props => ['Admin Signed In Successfully'];
}

class SignedOutSuccessfully extends RegisterState{
  @override
  List<Object?> get props => ['Signed Out Successfully'];
}

class RegisterFailure extends RegisterState{
  @override
  List<Object?> get props => ['Verification Failure'];
}


