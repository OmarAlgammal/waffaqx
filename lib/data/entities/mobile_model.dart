import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wafaq_x/data/entities/mobile_model/battery.dart';
import 'package:wafaq_x/data/entities/mobile_model/dimensions_and_weight.dart';
import 'package:wafaq_x/data/entities/mobile_model/display.dart';



part 'mobile_model.g.dart';
part 'mobile_model.freezed.dart';

@freezed
class MobileModel with _$MobileModel{

  factory MobileModel({
    required String brandName,

    required String mobileId,
    required String mobileName,
// display
    required Display display,
// dimensions and weight
    required DimensionsAndWeight dimensionsAndWeight,
// network technology
    required String networkTechnology,
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
    required Battery battery,
// charging inlet
    required String chargingInlet,
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
      display,
      dimensionsAndWeight,
      networkTechnology,
      processor,
      storageAndRam,
      mainCameras,
      selfieCameras,
      battery,
      chargingInlet,
      os,
      hasNotch,
    ];
  }

}
