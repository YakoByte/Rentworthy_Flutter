// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetReviewImpl _$$GetReviewImplFromJson(Map<String, dynamic> json) =>
    _$GetReviewImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ReviewData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetReviewImplToJson(_$GetReviewImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ReviewDataImpl _$$ReviewDataImplFromJson(Map<String, dynamic> json) =>
    _$ReviewDataImpl(
      total_review: json['total_review'] as String?,
      total_review_count: json['total_review_count'] as String?,
      five_star: json['five_star'] as String?,
      four_star: json['four_star'] as String?,
      three_star: json['three_star'] as String?,
      two_star: json['two_star'] as String?,
      one_star: json['one_star'] as String?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReviewDataImplToJson(_$ReviewDataImpl instance) =>
    <String, dynamic>{
      'total_review': instance.total_review,
      'total_review_count': instance.total_review_count,
      'five_star': instance.five_star,
      'four_star': instance.four_star,
      'three_star': instance.three_star,
      'two_star': instance.two_star,
      'one_star': instance.one_star,
      'reviews': instance.reviews,
    };

_$ReviewDetailsImpl _$$ReviewDetailsImplFromJson(Map<String, dynamic> json) =>
    _$ReviewDetailsImpl(
      user_name: json['user_name'] as String?,
      user_img: json['user_img'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as String?,
      review_date: json['review_date'] as String?,
    );

Map<String, dynamic> _$$ReviewDetailsImplToJson(_$ReviewDetailsImpl instance) =>
    <String, dynamic>{
      'user_name': instance.user_name,
      'user_img': instance.user_img,
      'review': instance.review,
      'rating': instance.rating,
      'review_date': instance.review_date,
    };
