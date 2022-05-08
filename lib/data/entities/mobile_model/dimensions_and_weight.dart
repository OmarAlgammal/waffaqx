


import 'package:freezed_annotation/freezed_annotation.dart';

part 'dimensions_and_weight.g.dart';
part 'dimensions_and_weight.freezed.dart';

@freezed
class DimensionsAndWeight with _$DimensionsAndWeight{
  factory DimensionsAndWeight({
    required String dimensions,
    required String weight,
  }) = _DimensionsAndWeight;


  factory DimensionsAndWeight.fromJson(Map<String, dynamic> map) => _$DimensionsAndWeightFromJson(map);
}
