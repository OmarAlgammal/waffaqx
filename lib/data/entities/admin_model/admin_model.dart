
import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_model.g.dart';
part 'admin_model.freezed.dart';

@freezed
class AdminModel with _$AdminModel{

  factory AdminModel({
    required String name,
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
    required bool deleteGlasses,
}) = _AdminModel;

  factory AdminModel.fromJson(Map<String, dynamic> map) => _$AdminModelFromJson(map);
}