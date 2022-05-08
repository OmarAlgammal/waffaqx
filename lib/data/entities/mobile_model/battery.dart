

import 'package:freezed_annotation/freezed_annotation.dart';

part 'battery.g.dart';
part 'battery.freezed.dart';

@freezed
class Battery with _$Battery{
  factory Battery({
    required String battery,
    required String chargingSpeed,
  }) = _Battery;


  factory Battery.fromJson(Map<String, dynamic> map) => _$BatteryFromJson(map);
}
