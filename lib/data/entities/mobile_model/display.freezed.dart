// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'display.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Display _$DisplayFromJson(Map<String, dynamic> json) {
  return _Display.fromJson(json);
}

/// @nodoc
class _$DisplayTearOff {
  const _$DisplayTearOff();

  _Display call(
      {required String displayType,
      required double displaySize,
      required String displayResolution,
      required String pixelDensity,
      required String frequency}) {
    return _Display(
      displayType: displayType,
      displaySize: displaySize,
      displayResolution: displayResolution,
      pixelDensity: pixelDensity,
      frequency: frequency,
    );
  }

  Display fromJson(Map<String, Object?> json) {
    return Display.fromJson(json);
  }
}

/// @nodoc
const $Display = _$DisplayTearOff();

/// @nodoc
mixin _$Display {
  String get displayType => throw _privateConstructorUsedError;
  double get displaySize => throw _privateConstructorUsedError;
  String get displayResolution => throw _privateConstructorUsedError;
  String get pixelDensity => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DisplayCopyWith<Display> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplayCopyWith<$Res> {
  factory $DisplayCopyWith(Display value, $Res Function(Display) then) =
      _$DisplayCopyWithImpl<$Res>;
  $Res call(
      {String displayType,
      double displaySize,
      String displayResolution,
      String pixelDensity,
      String frequency});
}

/// @nodoc
class _$DisplayCopyWithImpl<$Res> implements $DisplayCopyWith<$Res> {
  _$DisplayCopyWithImpl(this._value, this._then);

  final Display _value;
  // ignore: unused_field
  final $Res Function(Display) _then;

  @override
  $Res call({
    Object? displayType = freezed,
    Object? displaySize = freezed,
    Object? displayResolution = freezed,
    Object? pixelDensity = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_value.copyWith(
      displayType: displayType == freezed
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as String,
      displaySize: displaySize == freezed
          ? _value.displaySize
          : displaySize // ignore: cast_nullable_to_non_nullable
              as double,
      displayResolution: displayResolution == freezed
          ? _value.displayResolution
          : displayResolution // ignore: cast_nullable_to_non_nullable
              as String,
      pixelDensity: pixelDensity == freezed
          ? _value.pixelDensity
          : pixelDensity // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DisplayCopyWith<$Res> implements $DisplayCopyWith<$Res> {
  factory _$DisplayCopyWith(_Display value, $Res Function(_Display) then) =
      __$DisplayCopyWithImpl<$Res>;
  @override
  $Res call(
      {String displayType,
      double displaySize,
      String displayResolution,
      String pixelDensity,
      String frequency});
}

/// @nodoc
class __$DisplayCopyWithImpl<$Res> extends _$DisplayCopyWithImpl<$Res>
    implements _$DisplayCopyWith<$Res> {
  __$DisplayCopyWithImpl(_Display _value, $Res Function(_Display) _then)
      : super(_value, (v) => _then(v as _Display));

  @override
  _Display get _value => super._value as _Display;

  @override
  $Res call({
    Object? displayType = freezed,
    Object? displaySize = freezed,
    Object? displayResolution = freezed,
    Object? pixelDensity = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_Display(
      displayType: displayType == freezed
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as String,
      displaySize: displaySize == freezed
          ? _value.displaySize
          : displaySize // ignore: cast_nullable_to_non_nullable
              as double,
      displayResolution: displayResolution == freezed
          ? _value.displayResolution
          : displayResolution // ignore: cast_nullable_to_non_nullable
              as String,
      pixelDensity: pixelDensity == freezed
          ? _value.pixelDensity
          : pixelDensity // ignore: cast_nullable_to_non_nullable
              as String,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Display implements _Display {
  _$_Display(
      {required this.displayType,
      required this.displaySize,
      required this.displayResolution,
      required this.pixelDensity,
      required this.frequency});

  factory _$_Display.fromJson(Map<String, dynamic> json) =>
      _$$_DisplayFromJson(json);

  @override
  final String displayType;
  @override
  final double displaySize;
  @override
  final String displayResolution;
  @override
  final String pixelDensity;
  @override
  final String frequency;

  @override
  String toString() {
    return 'Display(displayType: $displayType, displaySize: $displaySize, displayResolution: $displayResolution, pixelDensity: $pixelDensity, frequency: $frequency)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Display &&
            const DeepCollectionEquality()
                .equals(other.displayType, displayType) &&
            const DeepCollectionEquality()
                .equals(other.displaySize, displaySize) &&
            const DeepCollectionEquality()
                .equals(other.displayResolution, displayResolution) &&
            const DeepCollectionEquality()
                .equals(other.pixelDensity, pixelDensity) &&
            const DeepCollectionEquality().equals(other.frequency, frequency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(displayType),
      const DeepCollectionEquality().hash(displaySize),
      const DeepCollectionEquality().hash(displayResolution),
      const DeepCollectionEquality().hash(pixelDensity),
      const DeepCollectionEquality().hash(frequency));

  @JsonKey(ignore: true)
  @override
  _$DisplayCopyWith<_Display> get copyWith =>
      __$DisplayCopyWithImpl<_Display>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DisplayToJson(this);
  }
}

abstract class _Display implements Display {
  factory _Display(
      {required String displayType,
      required double displaySize,
      required String displayResolution,
      required String pixelDensity,
      required String frequency}) = _$_Display;

  factory _Display.fromJson(Map<String, dynamic> json) = _$_Display.fromJson;

  @override
  String get displayType;
  @override
  double get displaySize;
  @override
  String get displayResolution;
  @override
  String get pixelDensity;
  @override
  String get frequency;
  @override
  @JsonKey(ignore: true)
  _$DisplayCopyWith<_Display> get copyWith =>
      throw _privateConstructorUsedError;
}
