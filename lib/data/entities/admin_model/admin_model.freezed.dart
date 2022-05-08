// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'admin_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdminModel _$AdminModelFromJson(Map<String, dynamic> json) {
  return _AdminModel.fromJson(json);
}

/// @nodoc
class _$AdminModelTearOff {
  const _$AdminModelTearOff();

  _AdminModel call(
      {required String name,
      required String email,
      required String password,
      required String mobileNumber,
      required String storeName,
      required String address,
      required bool addMobiles,
      required bool deleteMobiles,
      required bool addCovers,
      required bool deleteCovers,
      required bool addGlasses,
      required bool deleteGlasses}) {
    return _AdminModel(
      name: name,
      email: email,
      password: password,
      mobileNumber: mobileNumber,
      storeName: storeName,
      address: address,
      addMobiles: addMobiles,
      deleteMobiles: deleteMobiles,
      addCovers: addCovers,
      deleteCovers: deleteCovers,
      addGlasses: addGlasses,
      deleteGlasses: deleteGlasses,
    );
  }

  AdminModel fromJson(Map<String, Object?> json) {
    return AdminModel.fromJson(json);
  }
}

/// @nodoc
const $AdminModel = _$AdminModelTearOff();

/// @nodoc
mixin _$AdminModel {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get storeName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  bool get addMobiles => throw _privateConstructorUsedError;
  bool get deleteMobiles => throw _privateConstructorUsedError;
  bool get addCovers => throw _privateConstructorUsedError;
  bool get deleteCovers => throw _privateConstructorUsedError;
  bool get addGlasses => throw _privateConstructorUsedError;
  bool get deleteGlasses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminModelCopyWith<AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminModelCopyWith<$Res> {
  factory $AdminModelCopyWith(
          AdminModel value, $Res Function(AdminModel) then) =
      _$AdminModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String email,
      String password,
      String mobileNumber,
      String storeName,
      String address,
      bool addMobiles,
      bool deleteMobiles,
      bool addCovers,
      bool deleteCovers,
      bool addGlasses,
      bool deleteGlasses});
}

/// @nodoc
class _$AdminModelCopyWithImpl<$Res> implements $AdminModelCopyWith<$Res> {
  _$AdminModelCopyWithImpl(this._value, this._then);

  final AdminModel _value;
  // ignore: unused_field
  final $Res Function(AdminModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? mobileNumber = freezed,
    Object? storeName = freezed,
    Object? address = freezed,
    Object? addMobiles = freezed,
    Object? deleteMobiles = freezed,
    Object? addCovers = freezed,
    Object? deleteCovers = freezed,
    Object? addGlasses = freezed,
    Object? deleteGlasses = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addMobiles: addMobiles == freezed
          ? _value.addMobiles
          : addMobiles // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteMobiles: deleteMobiles == freezed
          ? _value.deleteMobiles
          : deleteMobiles // ignore: cast_nullable_to_non_nullable
              as bool,
      addCovers: addCovers == freezed
          ? _value.addCovers
          : addCovers // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteCovers: deleteCovers == freezed
          ? _value.deleteCovers
          : deleteCovers // ignore: cast_nullable_to_non_nullable
              as bool,
      addGlasses: addGlasses == freezed
          ? _value.addGlasses
          : addGlasses // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteGlasses: deleteGlasses == freezed
          ? _value.deleteGlasses
          : deleteGlasses // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AdminModelCopyWith<$Res> implements $AdminModelCopyWith<$Res> {
  factory _$AdminModelCopyWith(
          _AdminModel value, $Res Function(_AdminModel) then) =
      __$AdminModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String email,
      String password,
      String mobileNumber,
      String storeName,
      String address,
      bool addMobiles,
      bool deleteMobiles,
      bool addCovers,
      bool deleteCovers,
      bool addGlasses,
      bool deleteGlasses});
}

/// @nodoc
class __$AdminModelCopyWithImpl<$Res> extends _$AdminModelCopyWithImpl<$Res>
    implements _$AdminModelCopyWith<$Res> {
  __$AdminModelCopyWithImpl(
      _AdminModel _value, $Res Function(_AdminModel) _then)
      : super(_value, (v) => _then(v as _AdminModel));

  @override
  _AdminModel get _value => super._value as _AdminModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? email = freezed,
    Object? password = freezed,
    Object? mobileNumber = freezed,
    Object? storeName = freezed,
    Object? address = freezed,
    Object? addMobiles = freezed,
    Object? deleteMobiles = freezed,
    Object? addCovers = freezed,
    Object? deleteCovers = freezed,
    Object? addGlasses = freezed,
    Object? deleteGlasses = freezed,
  }) {
    return _then(_AdminModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: mobileNumber == freezed
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: storeName == freezed
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addMobiles: addMobiles == freezed
          ? _value.addMobiles
          : addMobiles // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteMobiles: deleteMobiles == freezed
          ? _value.deleteMobiles
          : deleteMobiles // ignore: cast_nullable_to_non_nullable
              as bool,
      addCovers: addCovers == freezed
          ? _value.addCovers
          : addCovers // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteCovers: deleteCovers == freezed
          ? _value.deleteCovers
          : deleteCovers // ignore: cast_nullable_to_non_nullable
              as bool,
      addGlasses: addGlasses == freezed
          ? _value.addGlasses
          : addGlasses // ignore: cast_nullable_to_non_nullable
              as bool,
      deleteGlasses: deleteGlasses == freezed
          ? _value.deleteGlasses
          : deleteGlasses // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdminModel implements _AdminModel {
  _$_AdminModel(
      {required this.name,
      required this.email,
      required this.password,
      required this.mobileNumber,
      required this.storeName,
      required this.address,
      required this.addMobiles,
      required this.deleteMobiles,
      required this.addCovers,
      required this.deleteCovers,
      required this.addGlasses,
      required this.deleteGlasses});

  factory _$_AdminModel.fromJson(Map<String, dynamic> json) =>
      _$$_AdminModelFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  final String mobileNumber;
  @override
  final String storeName;
  @override
  final String address;
  @override
  final bool addMobiles;
  @override
  final bool deleteMobiles;
  @override
  final bool addCovers;
  @override
  final bool deleteCovers;
  @override
  final bool addGlasses;
  @override
  final bool deleteGlasses;

  @override
  String toString() {
    return 'AdminModel(name: $name, email: $email, password: $password, mobileNumber: $mobileNumber, storeName: $storeName, address: $address, addMobiles: $addMobiles, deleteMobiles: $deleteMobiles, addCovers: $addCovers, deleteCovers: $deleteCovers, addGlasses: $addGlasses, deleteGlasses: $deleteGlasses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.mobileNumber, mobileNumber) &&
            const DeepCollectionEquality().equals(other.storeName, storeName) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality()
                .equals(other.addMobiles, addMobiles) &&
            const DeepCollectionEquality()
                .equals(other.deleteMobiles, deleteMobiles) &&
            const DeepCollectionEquality().equals(other.addCovers, addCovers) &&
            const DeepCollectionEquality()
                .equals(other.deleteCovers, deleteCovers) &&
            const DeepCollectionEquality()
                .equals(other.addGlasses, addGlasses) &&
            const DeepCollectionEquality()
                .equals(other.deleteGlasses, deleteGlasses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(mobileNumber),
      const DeepCollectionEquality().hash(storeName),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(addMobiles),
      const DeepCollectionEquality().hash(deleteMobiles),
      const DeepCollectionEquality().hash(addCovers),
      const DeepCollectionEquality().hash(deleteCovers),
      const DeepCollectionEquality().hash(addGlasses),
      const DeepCollectionEquality().hash(deleteGlasses));

  @JsonKey(ignore: true)
  @override
  _$AdminModelCopyWith<_AdminModel> get copyWith =>
      __$AdminModelCopyWithImpl<_AdminModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdminModelToJson(this);
  }
}

abstract class _AdminModel implements AdminModel {
  factory _AdminModel(
      {required String name,
      required String email,
      required String password,
      required String mobileNumber,
      required String storeName,
      required String address,
      required bool addMobiles,
      required bool deleteMobiles,
      required bool addCovers,
      required bool deleteCovers,
      required bool addGlasses,
      required bool deleteGlasses}) = _$_AdminModel;

  factory _AdminModel.fromJson(Map<String, dynamic> json) =
      _$_AdminModel.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  String get mobileNumber;
  @override
  String get storeName;
  @override
  String get address;
  @override
  bool get addMobiles;
  @override
  bool get deleteMobiles;
  @override
  bool get addCovers;
  @override
  bool get deleteCovers;
  @override
  bool get addGlasses;
  @override
  bool get deleteGlasses;
  @override
  @JsonKey(ignore: true)
  _$AdminModelCopyWith<_AdminModel> get copyWith =>
      throw _privateConstructorUsedError;
}
