import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_items.freezed.dart';

part 'get_items.g.dart';

@freezed
abstract class GetItem with _$GetItem {
  const factory GetItem({
    required bool? success,
    required String? message,
    required List<ItemData>? data,
  }) = _GetItem;

  factory GetItem.fromJson(Map<String, dynamic> json) =>
      _$GetItemFromJson(json);
}

@freezed
abstract class ItemData with _$ItemData {
  const factory ItemData({
    required String? id,
    required String? name,
    required List<String>? imgs,
    required String? thumbnail,
    required String? desc,
    required String? location,
    required String? time_period,
    required String? lat,
    required String? long,
    required String? link,
    required String? price,
    required bool? isfav,
  }) = _ItemData;

  factory ItemData.fromJson(Map<String, dynamic> json) =>
      _$ItemDataFromJson(json);
}
