
import 'package:equatable/equatable.dart';

abstract class CoversCompatibilitiesEvent extends Equatable{}

class LoadCoversCompatibilities extends CoversCompatibilitiesEvent{
  @override
  List<Object?> get props => ['Load Covers Compatibilities'];
}