

import 'package:freezed_annotation/freezed_annotation.dart';

part 'display.g.dart';
part 'display.freezed.dart';

@freezed
class Display with _$Display{
  factory Display({
    required String displayType,
    required double displaySize,
    required String displayResolution,
    required String pixelDensity,
    required String frequency,
  }) = _Display;


  factory Display.fromJson(Map<String, dynamic> map) => _$DisplayFromJson(map);
}
