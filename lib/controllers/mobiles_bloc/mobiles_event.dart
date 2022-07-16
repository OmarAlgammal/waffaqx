
import 'package:equatable/equatable.dart';

abstract class MobilesEvent extends Equatable{}

class MobilesInitialEvent extends MobilesEvent{
  @override
  List<Object?> get props => [];
}

class LoadMobiles extends MobilesEvent{
  @override
  List<Object?> get props => [];
}

class LoadBrandMobiles extends MobilesEvent{
  final String brandName;
  LoadBrandMobiles({required this.brandName});
  @override
  List<Object?> get props => [];

}
