// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'battery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Battery _$BatteryFromJson(Map<String, dynamic> json) {
  return _Battery.fromJson(json);
}

/// @nodoc
class _$BatteryTearOff {
  const _$BatteryTearOff();

  _Battery call({required String battery, required String chargingSpeed}) {
    return _Battery(
      battery: battery,
      chargingSpeed: chargingSpeed,
    );
  }

  Battery fromJson(Map<String, Object?> json) {
    return Battery.fromJson(json);
  }
}

/// @nodoc
const $Battery = _$BatteryTearOff();

/// @nodoc
mixin _$Battery {
  String get battery => throw _privateConstructorUsedError;
  String get chargingSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatteryCopyWith<Battery> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatteryCopyWith<$Res> {
  factory $BatteryCopyWith(Battery value, $Res Function(Battery) then) =
      _$BatteryCopyWithImpl<$Res>;
  $Res call({String battery, String chargingSpeed});
}

/// @nodoc
class _$BatteryCopyWithImpl<$Res> implements $BatteryCopyWith<$Res> {
  _$BatteryCopyWithImpl(this._value, this._then);

  final Battery _value;
  // ignore: unused_field
  final $Res Function(Battery) _then;

  @override
  $Res call({
    Object? battery = freezed,
    Object? chargingSpeed = freezed,
  }) {
    return _then(_value.copyWith(
      battery: battery == freezed
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as String,
      chargingSpeed: chargingSpeed == freezed
          ? _value.chargingSpeed
          : chargingSpeed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$BatteryCopyWith<$Res> implements $BatteryCopyWith<$Res> {
  factory _$BatteryCopyWith(_Battery value, $Res Function(_Battery) then) =
      __$BatteryCopyWithImpl<$Res>;
  @override
  $Res call({String battery, String chargingSpeed});
}

/// @nodoc
class __$BatteryCopyWithImpl<$Res> extends _$BatteryCopyWithImpl<$Res>
    implements _$BatteryCopyWith<$Res> {
  __$BatteryCopyWithImpl(_Battery _value, $Res Function(_Battery) _then)
      : super(_value, (v) => _then(v as _Battery));

  @override
  _Battery get _value => super._value as _Battery;

  @override
  $Res call({
    Object? battery = freezed,
    Object? chargingSpeed = freezed,
  }) {
    return _then(_Battery(
      battery: battery == freezed
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as String,
      chargingSpeed: chargingSpeed == freezed
          ? _value.chargingSpeed
          : chargingSpeed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Battery implements _Battery {
  _$_Battery({required this.battery, required this.chargingSpeed});

  factory _$_Battery.fromJson(Map<String, dynamic> json) =>
      _$$_BatteryFromJson(json);

  @override
  final String battery;
  @override
  final String chargingSpeed;

  @override
  String toString() {
    return 'Battery(battery: $battery, chargingSpeed: $chargingSpeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Battery &&
            const DeepCollectionEquality().equals(other.battery, battery) &&
            const DeepCollectionEquality()
                .equals(other.chargingSpeed, chargingSpeed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(battery),
      const DeepCollectionEquality().hash(chargingSpeed));

  @JsonKey(ignore: true)
  @override
  _$BatteryCopyWith<_Battery> get copyWith =>
      __$BatteryCopyWithImpl<_Battery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BatteryToJson(this);
  }
}

abstract class _Battery implements Battery {
  factory _Battery({required String battery, required String chargingSpeed}) =
      _$_Battery;

  factory _Battery.fromJson(Map<String, dynamic> json) = _$_Battery.fromJson;

  @override
  String get battery;
  @override
  String get chargingSpeed;
  @override
  @JsonKey(ignore: true)
  _$BatteryCopyWith<_Battery> get copyWith =>
      throw _privateConstructorUsedError;
}
