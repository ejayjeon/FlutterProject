import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String uuid,
    required String email,
    String? name,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  // Map<String, dynamic> toJson() => _$UserModelToJson(UserModel);

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      uuid: data?['uuid'],
      email: data?['email'],
      name: data?['name'],
      createdAt: data?['createdAt'],
    );
  }

  // _$UserModelToJson(UserModel userModel) {}

  // Map<String, dynamic> toFireStore() {
  //   return {
  //     "uuid":
  //   }
  // }
}
