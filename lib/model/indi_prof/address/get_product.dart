import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product.freezed.dart';

part 'get_product.g.dart';

@freezed
abstract class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required List<ProductData>? products,
    required int? total,
    required int? skip,
    required int? limit,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@freezed
abstract class ProductData with _$ProductData {
  const factory ProductData({
    required int? id,
    required String? title,
    required String? description,
    required double? price,
    required double? discountPercentage,
    required double? rating,
    required int? stock,
    required String? brand,
    required String? category,
    required String? thumbnail,
    required List<String>? images,
  }) = _ProductData;

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);
}
