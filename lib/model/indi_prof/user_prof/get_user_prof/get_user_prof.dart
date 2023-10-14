import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_prof.freezed.dart';

part 'get_user_prof.g.dart';

@freezed
abstract class GetUserProf with _$GetUserProf {
  const factory GetUserProf({
    required bool? success,
    required String? message,
    required List<UserData>? data,
  }) = _GetUserProf;

  factory GetUserProf.fromJson(Map<String, dynamic> json) =>
      _$GetUserProfFromJson(json);
}

@freezed
abstract class UserData with _$UserData {
  const factory UserData({
    required String? user_id,
    required String? user_name,
    required String? user_img,
    required String? user_desc,
    required String? user_contrycode,
    required String? user_phoneno,
    required String? user_email,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
