import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_product_details.freezed.dart';
part 'get_product_details.g.dart';

@freezed
abstract class ProductDetailsResponse with _$ProductDetailsResponse {
  const factory ProductDetailsResponse({
    required bool? success,
    required String? message,
    required List<ProductDetailsData>? data,
  }) = _ProductDetailsResponse;

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
}

@freezed
abstract class ProductDetailsData with _$ProductDetailsData {
  const factory ProductDetailsData({
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
    required String? tracking_id,
    required String? seller_id,
    required String? seller_name,
    required String? seller_img,
    required String? posted_on,
    required bool? isfav,
    required String? total_review,
    required String? total_review_rating,
    required String? five_star,
    required String? four_star,
    required String? three_star,
    required String? two_star,
    required String? one_star,
    required List<ProductReview>? reviews,
  }) = _ProductDetailsData;

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsDataFromJson(json);
}

@freezed
abstract class ProductReview with _$ProductReview {
  const factory ProductReview({
    required String? user_name,
    required String? user_img,
    required String? review_title,
    required String? review,
    required String? rating,
    required String? like,
    required String? dislike,
    required bool? is_user_certified,
    required String? user_location,
    required String? review_date,
  }) = _ProductReview;

  factory ProductReview.fromJson(Map<String, dynamic> json) =>
      _$ProductReviewFromJson(json);
}
