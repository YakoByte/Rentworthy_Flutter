// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDetailsResponseImpl _$$ProductDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDetailsResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductDetailsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductDetailsResponseImplToJson(
        _$ProductDetailsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ProductDetailsDataImpl _$$ProductDetailsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductDetailsDataImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imgs: (json['imgs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String?,
      desc: json['desc'] as String?,
      location: json['location'] as String?,
      time_period: json['time_period'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      link: json['link'] as String?,
      price: json['price'] as String?,
      tracking_id: json['tracking_id'] as String?,
      seller_id: json['seller_id'] as String?,
      seller_name: json['seller_name'] as String?,
      seller_img: json['seller_img'] as String?,
      posted_on: json['posted_on'] as String?,
      isfav: json['isfav'] as bool?,
      total_review: json['total_review'] as String?,
      total_review_rating: json['total_review_rating'] as String?,
      five_star: json['five_star'] as String?,
      four_star: json['four_star'] as String?,
      three_star: json['three_star'] as String?,
      two_star: json['two_star'] as String?,
      one_star: json['one_star'] as String?,
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => ProductReview.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProductDetailsDataImplToJson(
        _$ProductDetailsDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgs': instance.imgs,
      'thumbnail': instance.thumbnail,
      'desc': instance.desc,
      'location': instance.location,
      'time_period': instance.time_period,
      'lat': instance.lat,
      'long': instance.long,
      'link': instance.link,
      'price': instance.price,
      'tracking_id': instance.tracking_id,
      'seller_id': instance.seller_id,
      'seller_name': instance.seller_name,
      'seller_img': instance.seller_img,
      'posted_on': instance.posted_on,
      'isfav': instance.isfav,
      'total_review': instance.total_review,
      'total_review_rating': instance.total_review_rating,
      'five_star': instance.five_star,
      'four_star': instance.four_star,
      'three_star': instance.three_star,
      'two_star': instance.two_star,
      'one_star': instance.one_star,
      'reviews': instance.reviews,
    };

_$ProductReviewImpl _$$ProductReviewImplFromJson(Map<String, dynamic> json) =>
    _$ProductReviewImpl(
      user_name: json['user_name'] as String?,
      user_img: json['user_img'] as String?,
      review_title: json['review_title'] as String?,
      review: json['review'] as String?,
      rating: json['rating'] as String?,
      like: json['like'] as String?,
      dislike: json['dislike'] as String?,
      is_user_certified: json['is_user_certified'] as bool?,
      user_location: json['user_location'] as String?,
      review_date: json['review_date'] as String?,
    );

Map<String, dynamic> _$$ProductReviewImplToJson(_$ProductReviewImpl instance) =>
    <String, dynamic>{
      'user_name': instance.user_name,
      'user_img': instance.user_img,
      'review_title': instance.review_title,
      'review': instance.review,
      'rating': instance.rating,
      'like': instance.like,
      'dislike': instance.dislike,
      'is_user_certified': instance.is_user_certified,
      'user_location': instance.user_location,
      'review_date': instance.review_date,
    };
