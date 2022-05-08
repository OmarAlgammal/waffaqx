// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdminModel _$$_AdminModelFromJson(Map<String, dynamic> json) =>
    _$_AdminModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      mobileNumber: json['mobileNumber'] as String,
      storeName: json['storeName'] as String,
      address: json['address'] as String,
      addMobiles: json['addMobiles'] as bool,
      deleteMobiles: json['deleteMobiles'] as bool,
      addCovers: json['addCovers'] as bool,
      deleteCovers: json['deleteCovers'] as bool,
      addGlasses: json['addGlasses'] as bool,
      deleteGlasses: json['deleteGlasses'] as bool,
    );

Map<String, dynamic> _$$_AdminModelToJson(_$_AdminModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'mobileNumber': instance.mobileNumber,
      'storeName': instance.storeName,
      'address': instance.address,
      'addMobiles': instance.addMobiles,
      'deleteMobiles': instance.deleteMobiles,
      'addCovers': instance.addCovers,
      'deleteCovers': instance.deleteCovers,
      'addGlasses': instance.addGlasses,
      'deleteGlasses': instance.deleteGlasses,
    };
