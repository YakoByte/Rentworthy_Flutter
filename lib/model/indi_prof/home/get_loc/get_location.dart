import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_location.freezed.dart';

part 'get_location.g.dart';

@freezed
abstract class GetLocation with _$GetLocation {
  const factory GetLocation({
    required bool? success,
    required String? message,
    required List<GetLocData>? data,
  }) = _GetLocation;

  factory GetLocation.fromJson(Map<String, dynamic> json) =>
      _$GetLocationFromJson(json);
}

@freezed
abstract class GetLocData with _$GetLocData {
  const factory GetLocData({
    required String? loc_id,
    required String? location,
    required String? lat,
    required String? long,
  }) = _GetLocData;

  factory GetLocData.fromJson(Map<String, dynamic> json) =>
      _$GetLocDataFromJson(json);
}
