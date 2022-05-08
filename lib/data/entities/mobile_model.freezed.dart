// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mobile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MobileModel _$MobileModelFromJson(Map<String, dynamic> json) {
  return _MobileModel.fromJson(json);
}

/// @nodoc
class _$MobileModelTearOff {
  const _$MobileModelTearOff();

  _MobileModel call(
      {required String brandName,
      required String mobileId,
      required String mobileName,
      required Display display,
      required DimensionsAndWeight dimensionsAndWeight,
      required String networkTechnology,
      required String processor,
      required List<String> storageAndRam,
      required List<String> mainCameras,
      required List<String> selfieCameras,
      required Battery battery,
      required String chargingInlet,
      required String os,
      required bool hasNotch}) {
    return _MobileModel(
      brandName: brandName,
      mobileId: mobileId,
      mobileName: mobileName,
      display: display,
      dimensionsAndWeight: dimensionsAndWeight,
      networkTechnology: networkTechnology,
      processor: processor,
      storageAndRam: storageAndRam,
      mainCameras: mainCameras,
      selfieCameras: selfieCameras,
      battery: battery,
      chargingInlet: chargingInlet,
      os: os,
      hasNotch: hasNotch,
    );
  }

  MobileModel fromJson(Map<String, Object?> json) {
    return MobileModel.fromJson(json);
  }
}

/// @nodoc
const $MobileModel = _$MobileModelTearOff();

/// @nodoc
mixin _$MobileModel {
  String get brandName => throw _privateConstructorUsedError;
  String get mobileId => throw _privateConstructorUsedError;
  String get mobileName => throw _privateConstructorUsedError; // display
  Display get display =>
      throw _privateConstructorUsedError; // dimensions and weight
  DimensionsAndWeight get dimensionsAndWeight =>
      throw _privateConstructorUsedError; // network technology
  String get networkTechnology =>
      throw _privateConstructorUsedError; // processor
  String get processor => throw _privateConstructorUsedError; // storage and ram
  List<String> get storageAndRam =>
      throw _privateConstructorUsedError; // cameras
//   main cameras
  List<String> get mainCameras =>
      throw _privateConstructorUsedError; //   selfie cameras
  List<String> get selfieCameras =>
      throw _privateConstructorUsedError; // battery
  Battery get battery => throw _privateConstructorUsedError; // charging inlet
  String get chargingInlet => throw _privateConstructorUsedError; // os
  String get os => throw _privateConstructorUsedError; // notch
  bool get hasNotch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MobileModelCopyWith<MobileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MobileModelCopyWith<$Res> {
  factory $MobileModelCopyWith(
          MobileModel value, $Res Function(MobileModel) then) =
      _$MobileModelCopyWithImpl<$Res>;
  $Res call(
      {String brandName,
      String mobileId,
      String mobileName,
      Display display,
      DimensionsAndWeight dimensionsAndWeight,
      String networkTechnology,
      String processor,
      List<String> storageAndRam,
      List<String> mainCameras,
      List<String> selfieCameras,
      Battery battery,
      String chargingInlet,
      String os,
      bool hasNotch});

  $DisplayCopyWith<$Res> get display;
  $DimensionsAndWeightCopyWith<$Res> get dimensionsAndWeight;
  $BatteryCopyWith<$Res> get battery;
}

/// @nodoc
class _$MobileModelCopyWithImpl<$Res> implements $MobileModelCopyWith<$Res> {
  _$MobileModelCopyWithImpl(this._value, this._then);

  final MobileModel _value;
  // ignore: unused_field
  final $Res Function(MobileModel) _then;

  @override
  $Res call({
    Object? brandName = freezed,
    Object? mobileId = freezed,
    Object? mobileName = freezed,
    Object? display = freezed,
    Object? dimensionsAndWeight = freezed,
    Object? networkTechnology = freezed,
    Object? processor = freezed,
    Object? storageAndRam = freezed,
    Object? mainCameras = freezed,
    Object? selfieCameras = freezed,
    Object? battery = freezed,
    Object? chargingInlet = freezed,
    Object? os = freezed,
    Object? hasNotch = freezed,
  }) {
    return _then(_value.copyWith(
      brandName: brandName == freezed
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileId: mobileId == freezed
          ? _value.mobileId
          : mobileId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileName: mobileName == freezed
          ? _value.mobileName
          : mobileName // ignore: cast_nullable_to_non_nullable
              as String,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as Display,
      dimensionsAndWeight: dimensionsAndWeight == freezed
          ? _value.dimensionsAndWeight
          : dimensionsAndWeight // ignore: cast_nullable_to_non_nullable
              as DimensionsAndWeight,
      networkTechnology: networkTechnology == freezed
          ? _value.networkTechnology
          : networkTechnology // ignore: cast_nullable_to_non_nullable
              as String,
      processor: processor == freezed
          ? _value.processor
          : processor // ignore: cast_nullable_to_non_nullable
              as String,
      storageAndRam: storageAndRam == freezed
          ? _value.storageAndRam
          : storageAndRam // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mainCameras: mainCameras == freezed
          ? _value.mainCameras
          : mainCameras // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selfieCameras: selfieCameras == freezed
          ? _value.selfieCameras
          : selfieCameras // ignore: cast_nullable_to_non_nullable
              as List<String>,
      battery: battery == freezed
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as Battery,
      chargingInlet: chargingInlet == freezed
          ? _value.chargingInlet
          : chargingInlet // ignore: cast_nullable_to_non_nullable
              as String,
      os: os == freezed
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      hasNotch: hasNotch == freezed
          ? _value.hasNotch
          : hasNotch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $DisplayCopyWith<$Res> get display {
    return $DisplayCopyWith<$Res>(_value.display, (value) {
      return _then(_value.copyWith(display: value));
    });
  }

  @override
  $DimensionsAndWeightCopyWith<$Res> get dimensionsAndWeight {
    return $DimensionsAndWeightCopyWith<$Res>(_value.dimensionsAndWeight,
        (value) {
      return _then(_value.copyWith(dimensionsAndWeight: value));
    });
  }

  @override
  $BatteryCopyWith<$Res> get battery {
    return $BatteryCopyWith<$Res>(_value.battery, (value) {
      return _then(_value.copyWith(battery: value));
    });
  }
}

/// @nodoc
abstract class _$MobileModelCopyWith<$Res>
    implements $MobileModelCopyWith<$Res> {
  factory _$MobileModelCopyWith(
          _MobileModel value, $Res Function(_MobileModel) then) =
      __$MobileModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String brandName,
      String mobileId,
      String mobileName,
      Display display,
      DimensionsAndWeight dimensionsAndWeight,
      String networkTechnology,
      String processor,
      List<String> storageAndRam,
      List<String> mainCameras,
      List<String> selfieCameras,
      Battery battery,
      String chargingInlet,
      String os,
      bool hasNotch});

  @override
  $DisplayCopyWith<$Res> get display;
  @override
  $DimensionsAndWeightCopyWith<$Res> get dimensionsAndWeight;
  @override
  $BatteryCopyWith<$Res> get battery;
}

/// @nodoc
class __$MobileModelCopyWithImpl<$Res> extends _$MobileModelCopyWithImpl<$Res>
    implements _$MobileModelCopyWith<$Res> {
  __$MobileModelCopyWithImpl(
      _MobileModel _value, $Res Function(_MobileModel) _then)
      : super(_value, (v) => _then(v as _MobileModel));

  @override
  _MobileModel get _value => super._value as _MobileModel;

  @override
  $Res call({
    Object? brandName = freezed,
    Object? mobileId = freezed,
    Object? mobileName = freezed,
    Object? display = freezed,
    Object? dimensionsAndWeight = freezed,
    Object? networkTechnology = freezed,
    Object? processor = freezed,
    Object? storageAndRam = freezed,
    Object? mainCameras = freezed,
    Object? selfieCameras = freezed,
    Object? battery = freezed,
    Object? chargingInlet = freezed,
    Object? os = freezed,
    Object? hasNotch = freezed,
  }) {
    return _then(_MobileModel(
      brandName: brandName == freezed
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileId: mobileId == freezed
          ? _value.mobileId
          : mobileId // ignore: cast_nullable_to_non_nullable
              as String,
      mobileName: mobileName == freezed
          ? _value.mobileName
          : mobileName // ignore: cast_nullable_to_non_nullable
              as String,
      display: display == freezed
          ? _value.display
          : display // ignore: cast_nullable_to_non_nullable
              as Display,
      dimensionsAndWeight: dimensionsAndWeight == freezed
          ? _value.dimensionsAndWeight
          : dimensionsAndWeight // ignore: cast_nullable_to_non_nullable
              as DimensionsAndWeight,
      networkTechnology: networkTechnology == freezed
          ? _value.networkTechnology
          : networkTechnology // ignore: cast_nullable_to_non_nullable
              as String,
      processor: processor == freezed
          ? _value.processor
          : processor // ignore: cast_nullable_to_non_nullable
              as String,
      storageAndRam: storageAndRam == freezed
          ? _value.storageAndRam
          : storageAndRam // ignore: cast_nullable_to_non_nullable
              as List<String>,
      mainCameras: mainCameras == freezed
          ? _value.mainCameras
          : mainCameras // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selfieCameras: selfieCameras == freezed
          ? _value.selfieCameras
          : selfieCameras // ignore: cast_nullable_to_non_nullable
              as List<String>,
      battery: battery == freezed
          ? _value.battery
          : battery // ignore: cast_nullable_to_non_nullable
              as Battery,
      chargingInlet: chargingInlet == freezed
          ? _value.chargingInlet
          : chargingInlet // ignore: cast_nullable_to_non_nullable
              as String,
      os: os == freezed
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      hasNotch: hasNotch == freezed
          ? _value.hasNotch
          : hasNotch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MobileModel implements _MobileModel {
  _$_MobileModel(
      {required this.brandName,
      required this.mobileId,
      required this.mobileName,
      required this.display,
      required this.dimensionsAndWeight,
      required this.networkTechnology,
      required this.processor,
      required this.storageAndRam,
      required this.mainCameras,
      required this.selfieCameras,
      required this.battery,
      required this.chargingInlet,
      required this.os,
      required this.hasNotch});

  factory _$_MobileModel.fromJson(Map<String, dynamic> json) =>
      _$$_MobileModelFromJson(json);

  @override
  final String brandName;
  @override
  final String mobileId;
  @override
  final String mobileName;
  @override // display
  final Display display;
  @override // dimensions and weight
  final DimensionsAndWeight dimensionsAndWeight;
  @override // network technology
  final String networkTechnology;
  @override // processor
  final String processor;
  @override // storage and ram
  final List<String> storageAndRam;
  @override // cameras
//   main cameras
  final List<String> mainCameras;
  @override //   selfie cameras
  final List<String> selfieCameras;
  @override // battery
  final Battery battery;
  @override // charging inlet
  final String chargingInlet;
  @override // os
  final String os;
  @override // notch
  final bool hasNotch;

  @override
  String toString() {
    return 'MobileModel(brandName: $brandName, mobileId: $mobileId, mobileName: $mobileName, display: $display, dimensionsAndWeight: $dimensionsAndWeight, networkTechnology: $networkTechnology, processor: $processor, storageAndRam: $storageAndRam, mainCameras: $mainCameras, selfieCameras: $selfieCameras, battery: $battery, chargingInlet: $chargingInlet, os: $os, hasNotch: $hasNotch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MobileModel &&
            const DeepCollectionEquality().equals(other.brandName, brandName) &&
            const DeepCollectionEquality().equals(other.mobileId, mobileId) &&
            const DeepCollectionEquality()
                .equals(other.mobileName, mobileName) &&
            const DeepCollectionEquality().equals(other.display, display) &&
            const DeepCollectionEquality()
                .equals(other.dimensionsAndWeight, dimensionsAndWeight) &&
            const DeepCollectionEquality()
                .equals(other.networkTechnology, networkTechnology) &&
            const DeepCollectionEquality().equals(other.processor, processor) &&
            const DeepCollectionEquality()
                .equals(other.storageAndRam, storageAndRam) &&
            const DeepCollectionEquality()
                .equals(other.mainCameras, mainCameras) &&
            const DeepCollectionEquality()
                .equals(other.selfieCameras, selfieCameras) &&
            const DeepCollectionEquality().equals(other.battery, battery) &&
            const DeepCollectionEquality()
                .equals(other.chargingInlet, chargingInlet) &&
            const DeepCollectionEquality().equals(other.os, os) &&
            const DeepCollectionEquality().equals(other.hasNotch, hasNotch));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brandName),
      const DeepCollectionEquality().hash(mobileId),
      const DeepCollectionEquality().hash(mobileName),
      const DeepCollectionEquality().hash(display),
      const DeepCollectionEquality().hash(dimensionsAndWeight),
      const DeepCollectionEquality().hash(networkTechnology),
      const DeepCollectionEquality().hash(processor),
      const DeepCollectionEquality().hash(storageAndRam),
      const DeepCollectionEquality().hash(mainCameras),
      const DeepCollectionEquality().hash(selfieCameras),
      const DeepCollectionEquality().hash(battery),
      const DeepCollectionEquality().hash(chargingInlet),
      const DeepCollectionEquality().hash(os),
      const DeepCollectionEquality().hash(hasNotch));

  @JsonKey(ignore: true)
  @override
  _$MobileModelCopyWith<_MobileModel> get copyWith =>
      __$MobileModelCopyWithImpl<_MobileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MobileModelToJson(this);
  }

  @override
  List<Object> toList() {
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

abstract class _MobileModel implements MobileModel {
  factory _MobileModel(
      {required String brandName,
      required String mobileId,
      required String mobileName,
      required Display display,
      required DimensionsAndWeight dimensionsAndWeight,
      required String networkTechnology,
      required String processor,
      required List<String> storageAndRam,
      required List<String> mainCameras,
      required List<String> selfieCameras,
      required Battery battery,
      required String chargingInlet,
      required String os,
      required bool hasNotch}) = _$_MobileModel;

  factory _MobileModel.fromJson(Map<String, dynamic> json) =
      _$_MobileModel.fromJson;

  @override
  String get brandName;
  @override
  String get mobileId;
  @override
  String get mobileName;
  @override // display
  Display get display;
  @override // dimensions and weight
  DimensionsAndWeight get dimensionsAndWeight;
  @override // network technology
  String get networkTechnology;
  @override // processor
  String get processor;
  @override // storage and ram
  List<String> get storageAndRam;
  @override // cameras
//   main cameras
  List<String> get mainCameras;
  @override //   selfie cameras
  List<String> get selfieCameras;
  @override // battery
  Battery get battery;
  @override // charging inlet
  String get chargingInlet;
  @override // os
  String get os;
  @override // notch
  bool get hasNotch;
  @override
  @JsonKey(ignore: true)
  _$MobileModelCopyWith<_MobileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
