import 'package:freezed_annotation/freezed_annotation.dart';

part 'g_map.freezed.dart';

part 'g_map.g.dart';

@freezed
class GMapResponse with _$GMapResponse {
  const factory GMapResponse({
    required List<Office>? offices,
    required List<Region>? regions,
  }) = _GMapResponse;

  factory GMapResponse.fromJson(Map<String, dynamic> json) =>
      _$GMapResponseFromJson(json);
}

@freezed
class Office with _$Office {
  const factory Office({
    required String address,
    required String id,
    required String image,
    required double lat,
    required double lng,
    required String name,
    required String phone,
    required String region,
  }) = _Office;

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
}

@freezed
class Region with _$Region {
  const factory Region({
    required double lat,
    required double lng,
    required String id,
    required String name,
    required int zoom,
  }) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
}
