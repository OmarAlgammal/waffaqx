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
      displaySize: (json['displaySize'] as num).toDouble(),
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
      battery: json['battery'] as String,
      os: json['os'] as String,
      hasNotch: json['hasNotch'] as bool,
    );

Map<String, dynamic> _$$_MobileModelToJson(_$_MobileModel instance) =>
    <String, dynamic>{
      'brandName': instance.brandName,
      'mobileId': instance.mobileId,
      'mobileName': instance.mobileName,
      'displaySize': instance.displaySize,
      'processor': instance.processor,
      'storageAndRam': instance.storageAndRam,
      'mainCameras': instance.mainCameras,
      'selfieCameras': instance.selfieCameras,
      'battery': instance.battery,
      'os': instance.os,
      'hasNotch': instance.hasNotch,
    };
