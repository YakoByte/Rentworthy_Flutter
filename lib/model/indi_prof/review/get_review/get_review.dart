import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_review.freezed.dart';

part 'get_review.g.dart';

@freezed
abstract class GetReview with _$GetReview {
  const factory GetReview({
    required bool? success,
    required String? message,
    required ReviewData? data,
  }) = _GetReview;

  factory GetReview.fromJson(Map<String, dynamic> json) =>
      _$GetReviewFromJson(json);
}

@freezed
abstract class ReviewData with _$ReviewData {
  const factory ReviewData({
    required String? total_review,
    required String? total_review_count,
    required String? five_star,
    required String? four_star,
    required String? three_star,
    required String? two_star,
    required String? one_star,
    required List<ReviewDetails>? reviews,
  }) = _ReviewData;

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);
}

@freezed
abstract class ReviewDetails with _$ReviewDetails {
  const factory ReviewDetails({
    required String? user_name,
    required String? user_img,
    required String? review,
    required String? rating,
    required String? review_date,
  }) = _ReviewDetails;

  factory ReviewDetails.fromJson(Map<String, dynamic> json) =>
      _$ReviewDetailsFromJson(json);
}
