// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MobileModel _$$_MobileModelFromJson(Map<String, dynamic> json) =>
    _$_MobileModel(
      brandName: json['brandName'] as String,
      mobileId: json['mobileId'] as String,
      mobileName: json['mobileName'] as String,
      display: Display.fromJson(json['display'] as Map<String, dynamic>),
      dimensionsAndWeight: DimensionsAndWeight.fromJson(
          json['dimensionsAndWeight'] as Map<String, dynamic>),
      networkTechnology: json['networkTechnology'] as String,
      processor: json['processor'] as String,
      storageAndRam: (json['storageAndRam'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mainCameras: (json['mainCameras'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      selfieCameras: (json['selfieCameras'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      battery: Battery.fromJson(json['battery'] as Map<String, dynamic>),
      chargingInlet: json['chargingInlet'] as String,
      os: json['os'] as String,
      hasNotch: json['hasNotch'] as bool,
    );

Map<String, dynamic> _$$_MobileModelToJson(_$_MobileModel instance) =>
    <String, dynamic>{
      'brandName': instance.brandName,
      'mobileId': instance.mobileId,
      'mobileName': instance.mobileName,
      'display': instance.display.toJson(),
      'dimensionsAndWeight': instance.dimensionsAndWeight.toJson(),
      'networkTechnology': instance.networkTechnology,
      'processor': instance.processor,
      'storageAndRam': instance.storageAndRam,
      'mainCameras': instance.mainCameras,
      'selfieCameras': instance.selfieCameras,
      'battery': instance.battery.toJson(),
      'chargingInlet': instance.chargingInlet,
      'os': instance.os,
      'hasNotch': instance.hasNotch,
    };
