// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dimensions_and_weight.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DimensionsAndWeight _$DimensionsAndWeightFromJson(Map<String, dynamic> json) {
  return _DimensionsAndWeight.fromJson(json);
}

/// @nodoc
class _$DimensionsAndWeightTearOff {
  const _$DimensionsAndWeightTearOff();

  _DimensionsAndWeight call(
      {required String dimensions, required String weight}) {
    return _DimensionsAndWeight(
      dimensions: dimensions,
      weight: weight,
    );
  }

  DimensionsAndWeight fromJson(Map<String, Object?> json) {
    return DimensionsAndWeight.fromJson(json);
  }
}

/// @nodoc
const $DimensionsAndWeight = _$DimensionsAndWeightTearOff();

/// @nodoc
mixin _$DimensionsAndWeight {
  String get dimensions => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DimensionsAndWeightCopyWith<DimensionsAndWeight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DimensionsAndWeightCopyWith<$Res> {
  factory $DimensionsAndWeightCopyWith(
          DimensionsAndWeight value, $Res Function(DimensionsAndWeight) then) =
      _$DimensionsAndWeightCopyWithImpl<$Res>;
  $Res call({String dimensions, String weight});
}

/// @nodoc
class _$DimensionsAndWeightCopyWithImpl<$Res>
    implements $DimensionsAndWeightCopyWith<$Res> {
  _$DimensionsAndWeightCopyWithImpl(this._value, this._then);

  final DimensionsAndWeight _value;
  // ignore: unused_field
  final $Res Function(DimensionsAndWeight) _then;

  @override
  $Res call({
    Object? dimensions = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      dimensions: dimensions == freezed
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DimensionsAndWeightCopyWith<$Res>
    implements $DimensionsAndWeightCopyWith<$Res> {
  factory _$DimensionsAndWeightCopyWith(_DimensionsAndWeight value,
          $Res Function(_DimensionsAndWeight) then) =
      __$DimensionsAndWeightCopyWithImpl<$Res>;
  @override
  $Res call({String dimensions, String weight});
}

/// @nodoc
class __$DimensionsAndWeightCopyWithImpl<$Res>
    extends _$DimensionsAndWeightCopyWithImpl<$Res>
    implements _$DimensionsAndWeightCopyWith<$Res> {
  __$DimensionsAndWeightCopyWithImpl(
      _DimensionsAndWeight _value, $Res Function(_DimensionsAndWeight) _then)
      : super(_value, (v) => _then(v as _DimensionsAndWeight));

  @override
  _DimensionsAndWeight get _value => super._value as _DimensionsAndWeight;

  @override
  $Res call({
    Object? dimensions = freezed,
    Object? weight = freezed,
  }) {
    return _then(_DimensionsAndWeight(
      dimensions: dimensions == freezed
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DimensionsAndWeight implements _DimensionsAndWeight {
  _$_DimensionsAndWeight({required this.dimensions, required this.weight});

  factory _$_DimensionsAndWeight.fromJson(Map<String, dynamic> json) =>
      _$$_DimensionsAndWeightFromJson(json);

  @override
  final String dimensions;
  @override
  final String weight;

  @override
  String toString() {
    return 'DimensionsAndWeight(dimensions: $dimensions, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DimensionsAndWeight &&
            const DeepCollectionEquality()
                .equals(other.dimensions, dimensions) &&
            const DeepCollectionEquality().equals(other.weight, weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dimensions),
      const DeepCollectionEquality().hash(weight));

  @JsonKey(ignore: true)
  @override
  _$DimensionsAndWeightCopyWith<_DimensionsAndWeight> get copyWith =>
      __$DimensionsAndWeightCopyWithImpl<_DimensionsAndWeight>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DimensionsAndWeightToJson(this);
  }
}

abstract class _DimensionsAndWeight implements DimensionsAndWeight {
  factory _DimensionsAndWeight(
      {required String dimensions,
      required String weight}) = _$_DimensionsAndWeight;

  factory _DimensionsAndWeight.fromJson(Map<String, dynamic> json) =
      _$_DimensionsAndWeight.fromJson;

  @override
  String get dimensions;
  @override
  String get weight;
  @override
  @JsonKey(ignore: true)
  _$DimensionsAndWeightCopyWith<_DimensionsAndWeight> get copyWith =>
      throw _privateConstructorUsedError;
}
