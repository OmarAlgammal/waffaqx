// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Display _$$_DisplayFromJson(Map<String, dynamic> json) => _$_Display(
      displayType: json['displayType'] as String,
      displaySize: (json['displaySize'] as num).toDouble(),
      displayResolution: json['displayResolution'] as String,
      pixelDensity: json['pixelDensity'] as String,
      frequency: json['frequency'] as String,
    );

Map<String, dynamic> _$$_DisplayToJson(_$_Display instance) =>
    <String, dynamic>{
      'displayType': instance.displayType,
      'displaySize': instance.displaySize,
      'displayResolution': instance.displayResolution,
      'pixelDensity': instance.pixelDensity,
      'frequency': instance.frequency,
    };
