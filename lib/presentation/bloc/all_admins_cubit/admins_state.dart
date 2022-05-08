

import 'package:equatable/equatable.dart';
import 'package:wafaq_x/data/entities/admin_model/admin_model.dart';

abstract class AdminsState extends Equatable{}

class AdminsLoadSuccess extends AdminsState{

  final List<AdminModel> admins;
  AdminsLoadSuccess({required this.admins});

  @override
  List<AdminModel?> get props => admins;

}

class AdminsLoadInProgress extends AdminsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class AdminsLoadFailure extends AdminsState{
  @override
  List<Object?> get props => ['admins load failure'];

}


class AdminSetSuccessfully extends AdminsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class AdminSetInProgress extends AdminsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}

class AdminSetFailure extends AdminsState{
  @override
  List<Object?> get props => throw UnimplementedError();

}