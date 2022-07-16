
import 'package:equatable/equatable.dart';
import 'package:wafaq_x/utilities/enums/authenticators.dart';

abstract class LogState extends Equatable{}

class InitialLogState extends LogState{
  @override
  List<Object?> get props => [];
}

class LogLoading extends LogState{
  @override
  List<Object?> get props => [];
}

class NotRegisterYet extends LogState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogInSuccessfully extends LogState{
  final Authenticators authenticators;
  LogInSuccessfully({required this.authenticators});
  @override
  List<Object?> get props => [];
}

class LoggingIn extends LogState{
  @override
  List<Object?> get props => [];
}

class LoggedOutSuccessfully extends LogState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoggingOut extends LogState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LogFailed extends LogState{
  @override
  List<Object?> get props => [];
}