import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mobile_model.g.dart';
part 'mobile_model.freezed.dart';

@freezed
class MobileModel  extends Equatable with _$MobileModel {

  factory MobileModel({
    required String brandName,

    required String mobileId,
    required String mobileName,
    required double displaySize,
// processor
    required String processor,
// storage and ram
    required List<String> storageAndRam,
// cameras
//   main cameras
    required List<String> mainCameras,
//   selfie cameras
    required List<String> selfieCameras,
// battery
    required String battery,
// os
    required String os,
// notch
    required bool hasNotch
  }) = _MobileModel;

  factory MobileModel.fromJson(Map<String, dynamic> map) => _$MobileModelFromJson(map);

  List<Object> toList(){
    return[
      brandName,
      mobileId,
      mobileName,
      displaySize,
      processor,
      storageAndRam,
      mainCameras,
      selfieCameras,
      battery,
      os,
      hasNotch,
    ];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [mobileId];

}