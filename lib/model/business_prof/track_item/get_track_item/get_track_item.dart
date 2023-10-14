import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_track_item.freezed.dart';
part 'get_track_item.g.dart';

@freezed
abstract class TrackingItemResponse with _$TrackingItemResponse {
  const factory TrackingItemResponse({
    required bool? success,
    required String? message,
    required List<TrackingItemData>? data,
  }) = _TrackingItemResponse;

  factory TrackingItemResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackingItemResponseFromJson(json);
}

@freezed
abstract class TrackingItemData with _$TrackingItemData {
  const factory TrackingItemData({
    required String? track_item_id,
    required String? product_name,
    required String? desc,
    required String? track_type,
    required String? thumbnail,
    required String? order_place_date,
    required String? renter_name,
    required String? order_id,
    required String? order_status,
    required String? shipping_address,
    required String? payment_method,
    required String? item_subtotal,
    required String? item_total,
  }) = _TrackingItemData;

  factory TrackingItemData.fromJson(Map<String, dynamic> json) =>
      _$TrackingItemDataFromJson(json);
}
