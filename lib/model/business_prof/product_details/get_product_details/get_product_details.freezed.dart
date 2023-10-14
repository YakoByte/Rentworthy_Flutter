// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_product_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDetailsResponse _$ProductDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _ProductDetailsResponse.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailsResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ProductDetailsData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailsResponseCopyWith<ProductDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsResponseCopyWith<$Res> {
  factory $ProductDetailsResponseCopyWith(ProductDetailsResponse value,
          $Res Function(ProductDetailsResponse) then) =
      _$ProductDetailsResponseCopyWithImpl<$Res, ProductDetailsResponse>;
  @useResult
  $Res call({bool? success, String? message, List<ProductDetailsData>? data});
}

/// @nodoc
class _$ProductDetailsResponseCopyWithImpl<$Res,
        $Val extends ProductDetailsResponse>
    implements $ProductDetailsResponseCopyWith<$Res> {
  _$ProductDetailsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDetailsResponseImplCopyWith<$Res>
    implements $ProductDetailsResponseCopyWith<$Res> {
  factory _$$ProductDetailsResponseImplCopyWith(
          _$ProductDetailsResponseImpl value,
          $Res Function(_$ProductDetailsResponseImpl) then) =
      __$$ProductDetailsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<ProductDetailsData>? data});
}

/// @nodoc
class __$$ProductDetailsResponseImplCopyWithImpl<$Res>
    extends _$ProductDetailsResponseCopyWithImpl<$Res,
        _$ProductDetailsResponseImpl>
    implements _$$ProductDetailsResponseImplCopyWith<$Res> {
  __$$ProductDetailsResponseImplCopyWithImpl(
      _$ProductDetailsResponseImpl _value,
      $Res Function(_$ProductDetailsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ProductDetailsResponseImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDetailsResponseImpl implements _ProductDetailsResponse {
  const _$ProductDetailsResponseImpl(
      {required this.success,
      required this.message,
      required final List<ProductDetailsData>? data})
      : _data = data;

  factory _$ProductDetailsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailsResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<ProductDetailsData>? _data;
  @override
  List<ProductDetailsData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductDetailsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailsResponseImplCopyWith<_$ProductDetailsResponseImpl>
      get copyWith => __$$ProductDetailsResponseImplCopyWithImpl<
          _$ProductDetailsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailsResponseImplToJson(
      this,
    );
  }
}

abstract class _ProductDetailsResponse implements ProductDetailsResponse {
  const factory _ProductDetailsResponse(
          {required final bool? success,
          required final String? message,
          required final List<ProductDetailsData>? data}) =
      _$ProductDetailsResponseImpl;

  factory _ProductDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$ProductDetailsResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<ProductDetailsData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailsResponseImplCopyWith<_$ProductDetailsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProductDetailsData _$ProductDetailsDataFromJson(Map<String, dynamic> json) {
  return _ProductDetailsData.fromJson(json);
}

/// @nodoc
mixin _$ProductDetailsData {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  List<String>? get imgs => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get time_period => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get tracking_id => throw _privateConstructorUsedError;
  String? get seller_id => throw _privateConstructorUsedError;
  String? get seller_name => throw _privateConstructorUsedError;
  String? get seller_img => throw _privateConstructorUsedError;
  String? get posted_on => throw _privateConstructorUsedError;
  bool? get isfav => throw _privateConstructorUsedError;
  String? get total_review => throw _privateConstructorUsedError;
  String? get total_review_rating => throw _privateConstructorUsedError;
  String? get five_star => throw _privateConstructorUsedError;
  String? get four_star => throw _privateConstructorUsedError;
  String? get three_star => throw _privateConstructorUsedError;
  String? get two_star => throw _privateConstructorUsedError;
  String? get one_star => throw _privateConstructorUsedError;
  List<ProductReview>? get reviews => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDetailsDataCopyWith<ProductDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDetailsDataCopyWith<$Res> {
  factory $ProductDetailsDataCopyWith(
          ProductDetailsData value, $Res Function(ProductDetailsData) then) =
      _$ProductDetailsDataCopyWithImpl<$Res, ProductDetailsData>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      List<String>? imgs,
      String? thumbnail,
      String? desc,
      String? location,
      String? time_period,
      String? lat,
      String? long,
      String? link,
      String? price,
      String? tracking_id,
      String? seller_id,
      String? seller_name,
      String? seller_img,
      String? posted_on,
      bool? isfav,
      String? total_review,
      String? total_review_rating,
      String? five_star,
      String? four_star,
      String? three_star,
      String? two_star,
      String? one_star,
      List<ProductReview>? reviews});
}

/// @nodoc
class _$ProductDetailsDataCopyWithImpl<$Res, $Val extends ProductDetailsData>
    implements $ProductDetailsDataCopyWith<$Res> {
  _$ProductDetailsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imgs = freezed,
    Object? thumbnail = freezed,
    Object? desc = freezed,
    Object? location = freezed,
    Object? time_period = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? link = freezed,
    Object? price = freezed,
    Object? tracking_id = freezed,
    Object? seller_id = freezed,
    Object? seller_name = freezed,
    Object? seller_img = freezed,
    Object? posted_on = freezed,
    Object? isfav = freezed,
    Object? total_review = freezed,
    Object? total_review_rating = freezed,
    Object? five_star = freezed,
    Object? four_star = freezed,
    Object? three_star = freezed,
    Object? two_star = freezed,
    Object? one_star = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imgs: freezed == imgs
          ? _value.imgs
          : imgs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      time_period: freezed == time_period
          ? _value.time_period
          : time_period // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      tracking_id: freezed == tracking_id
          ? _value.tracking_id
          : tracking_id // ignore: cast_nullable_to_non_nullable
              as String?,
      seller_id: freezed == seller_id
          ? _value.seller_id
          : seller_id // ignore: cast_nullable_to_non_nullable
              as String?,
      seller_name: freezed == seller_name
          ? _value.seller_name
          : seller_name // ignore: cast_nullable_to_non_nullable
              as String?,
      seller_img: freezed == seller_img
          ? _value.seller_img
          : seller_img // ignore: cast_nullable_to_non_nullable
              as String?,
      posted_on: freezed == posted_on
          ? _value.posted_on
          : posted_on // ignore: cast_nullable_to_non_nullable
              as String?,
      isfav: freezed == isfav
          ? _value.isfav
          : isfav // ignore: cast_nullable_to_non_nullable
              as bool?,
      total_review: freezed == total_review
          ? _value.total_review
          : total_review // ignore: cast_nullable_to_non_nullable
              as String?,
      total_review_rating: freezed == total_review_rating
          ? _value.total_review_rating
          : total_review_rating // ignore: cast_nullable_to_non_nullable
              as String?,
      five_star: freezed == five_star
          ? _value.five_star
          : five_star // ignore: cast_nullable_to_non_nullable
              as String?,
      four_star: freezed == four_star
          ? _value.four_star
          : four_star // ignore: cast_nullable_to_non_nullable
              as String?,
      three_star: freezed == three_star
          ? _value.three_star
          : three_star // ignore: cast_nullable_to_non_nullable
              as String?,
      two_star: freezed == two_star
          ? _value.two_star
          : two_star // ignore: cast_nullable_to_non_nullable
              as String?,
      one_star: freezed == one_star
          ? _value.one_star
          : one_star // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ProductReview>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDetailsDataImplCopyWith<$Res>
    implements $ProductDetailsDataCopyWith<$Res> {
  factory _$$ProductDetailsDataImplCopyWith(_$ProductDetailsDataImpl value,
          $Res Function(_$ProductDetailsDataImpl) then) =
      __$$ProductDetailsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      List<String>? imgs,
      String? thumbnail,
      String? desc,
      String? location,
      String? time_period,
      String? lat,
      String? long,
      String? link,
      String? price,
      String? tracking_id,
      String? seller_id,
      String? seller_name,
      String? seller_img,
      String? posted_on,
      bool? isfav,
      String? total_review,
      String? total_review_rating,
      String? five_star,
      String? four_star,
      String? three_star,
      String? two_star,
      String? one_star,
      List<ProductReview>? reviews});
}

/// @nodoc
class __$$ProductDetailsDataImplCopyWithImpl<$Res>
    extends _$ProductDetailsDataCopyWithImpl<$Res, _$ProductDetailsDataImpl>
    implements _$$ProductDetailsDataImplCopyWith<$Res> {
  __$$ProductDetailsDataImplCopyWithImpl(_$ProductDetailsDataImpl _value,
      $Res Function(_$ProductDetailsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? imgs = freezed,
    Object? thumbnail = freezed,
    Object? desc = freezed,
    Object? location = freezed,
    Object? time_period = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? link = freezed,
    Object? price = freezed,
    Object? tracking_id = freezed,
    Object? seller_id = freezed,
    Object? seller_name = freezed,
    Object? seller_img = freezed,
    Object? posted_on = freezed,
    Object? isfav = freezed,
    Object? total_review = freezed,
    Object? total_review_rating = freezed,
    Object? five_star = freezed,
    Object? four_star = freezed,
    Object? three_star = freezed,
    Object? two_star = freezed,
    Object? one_star = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_$ProductDetailsDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imgs: freezed == imgs
          ? _value._imgs
          : imgs // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      time_period: freezed == time_period
          ? _value.time_period
          : time_period // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      tracking_id: freezed == tracking_id
          ? _value.tracking_id
          : tracking_id // ignore: cast_nullable_to_non_nullable
              as String?,
      seller_id: freezed == seller_id
          ? _value.seller_id
          : seller_id // ignore: cast_nullable_to_non_nullable
              as String?,
      seller_name: freezed == seller_name
          ? _value.seller_name
          : seller_name // ignore: cast_nullable_to_non_nullable
              as String?,
      seller_img: freezed == seller_img
          ? _value.seller_img
          : seller_img // ignore: cast_nullable_to_non_nullable
              as String?,
      posted_on: freezed == posted_on
          ? _value.posted_on
          : posted_on // ignore: cast_nullable_to_non_nullable
              as String?,
      isfav: freezed == isfav
          ? _value.isfav
          : isfav // ignore: cast_nullable_to_non_nullable
              as bool?,
      total_review: freezed == total_review
          ? _value.total_review
          : total_review // ignore: cast_nullable_to_non_nullable
              as String?,
      total_review_rating: freezed == total_review_rating
          ? _value.total_review_rating
          : total_review_rating // ignore: cast_nullable_to_non_nullable
              as String?,
      five_star: freezed == five_star
          ? _value.five_star
          : five_star // ignore: cast_nullable_to_non_nullable
              as String?,
      four_star: freezed == four_star
          ? _value.four_star
          : four_star // ignore: cast_nullable_to_non_nullable
              as String?,
      three_star: freezed == three_star
          ? _value.three_star
          : three_star // ignore: cast_nullable_to_non_nullable
              as String?,
      two_star: freezed == two_star
          ? _value.two_star
          : two_star // ignore: cast_nullable_to_non_nullable
              as String?,
      one_star: freezed == one_star
          ? _value.one_star
          : one_star // ignore: cast_nullable_to_non_nullable
              as String?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ProductReview>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductDetailsDataImpl implements _ProductDetailsData {
  const _$ProductDetailsDataImpl(
      {required this.id,
      required this.name,
      required final List<String>? imgs,
      required this.thumbnail,
      required this.desc,
      required this.location,
      required this.time_period,
      required this.lat,
      required this.long,
      required this.link,
      required this.price,
      required this.tracking_id,
      required this.seller_id,
      required this.seller_name,
      required this.seller_img,
      required this.posted_on,
      required this.isfav,
      required this.total_review,
      required this.total_review_rating,
      required this.five_star,
      required this.four_star,
      required this.three_star,
      required this.two_star,
      required this.one_star,
      required final List<ProductReview>? reviews})
      : _imgs = imgs,
        _reviews = reviews;

  factory _$ProductDetailsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDetailsDataImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  final List<String>? _imgs;
  @override
  List<String>? get imgs {
    final value = _imgs;
    if (value == null) return null;
    if (_imgs is EqualUnmodifiableListView) return _imgs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? thumbnail;
  @override
  final String? desc;
  @override
  final String? location;
  @override
  final String? time_period;
  @override
  final String? lat;
  @override
  final String? long;
  @override
  final String? link;
  @override
  final String? price;
  @override
  final String? tracking_id;
  @override
  final String? seller_id;
  @override
  final String? seller_name;
  @override
  final String? seller_img;
  @override
  final String? posted_on;
  @override
  final bool? isfav;
  @override
  final String? total_review;
  @override
  final String? total_review_rating;
  @override
  final String? five_star;
  @override
  final String? four_star;
  @override
  final String? three_star;
  @override
  final String? two_star;
  @override
  final String? one_star;
  final List<ProductReview>? _reviews;
  @override
  List<ProductReview>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductDetailsData(id: $id, name: $name, imgs: $imgs, thumbnail: $thumbnail, desc: $desc, location: $location, time_period: $time_period, lat: $lat, long: $long, link: $link, price: $price, tracking_id: $tracking_id, seller_id: $seller_id, seller_name: $seller_name, seller_img: $seller_img, posted_on: $posted_on, isfav: $isfav, total_review: $total_review, total_review_rating: $total_review_rating, five_star: $five_star, four_star: $four_star, three_star: $three_star, two_star: $two_star, one_star: $one_star, reviews: $reviews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDetailsDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._imgs, _imgs) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.time_period, time_period) ||
                other.time_period == time_period) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tracking_id, tracking_id) ||
                other.tracking_id == tracking_id) &&
            (identical(other.seller_id, seller_id) ||
                other.seller_id == seller_id) &&
            (identical(other.seller_name, seller_name) ||
                other.seller_name == seller_name) &&
            (identical(other.seller_img, seller_img) ||
                other.seller_img == seller_img) &&
            (identical(other.posted_on, posted_on) ||
                other.posted_on == posted_on) &&
            (identical(other.isfav, isfav) || other.isfav == isfav) &&
            (identical(other.total_review, total_review) ||
                other.total_review == total_review) &&
            (identical(other.total_review_rating, total_review_rating) ||
                other.total_review_rating == total_review_rating) &&
            (identical(other.five_star, five_star) ||
                other.five_star == five_star) &&
            (identical(other.four_star, four_star) ||
                other.four_star == four_star) &&
            (identical(other.three_star, three_star) ||
                other.three_star == three_star) &&
            (identical(other.two_star, two_star) ||
                other.two_star == two_star) &&
            (identical(other.one_star, one_star) ||
                other.one_star == one_star) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        const DeepCollectionEquality().hash(_imgs),
        thumbnail,
        desc,
        location,
        time_period,
        lat,
        long,
        link,
        price,
        tracking_id,
        seller_id,
        seller_name,
        seller_img,
        posted_on,
        isfav,
        total_review,
        total_review_rating,
        five_star,
        four_star,
        three_star,
        two_star,
        one_star,
        const DeepCollectionEquality().hash(_reviews)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDetailsDataImplCopyWith<_$ProductDetailsDataImpl> get copyWith =>
      __$$ProductDetailsDataImplCopyWithImpl<_$ProductDetailsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDetailsDataImplToJson(
      this,
    );
  }
}

abstract class _ProductDetailsData implements ProductDetailsData {
  const factory _ProductDetailsData(
      {required final String? id,
      required final String? name,
      required final List<String>? imgs,
      required final String? thumbnail,
      required final String? desc,
      required final String? location,
      required final String? time_period,
      required final String? lat,
      required final String? long,
      required final String? link,
      required final String? price,
      required final String? tracking_id,
      required final String? seller_id,
      required final String? seller_name,
      required final String? seller_img,
      required final String? posted_on,
      required final bool? isfav,
      required final String? total_review,
      required final String? total_review_rating,
      required final String? five_star,
      required final String? four_star,
      required final String? three_star,
      required final String? two_star,
      required final String? one_star,
      required final List<ProductReview>? reviews}) = _$ProductDetailsDataImpl;

  factory _ProductDetailsData.fromJson(Map<String, dynamic> json) =
      _$ProductDetailsDataImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  List<String>? get imgs;
  @override
  String? get thumbnail;
  @override
  String? get desc;
  @override
  String? get location;
  @override
  String? get time_period;
  @override
  String? get lat;
  @override
  String? get long;
  @override
  String? get link;
  @override
  String? get price;
  @override
  String? get tracking_id;
  @override
  String? get seller_id;
  @override
  String? get seller_name;
  @override
  String? get seller_img;
  @override
  String? get posted_on;
  @override
  bool? get isfav;
  @override
  String? get total_review;
  @override
  String? get total_review_rating;
  @override
  String? get five_star;
  @override
  String? get four_star;
  @override
  String? get three_star;
  @override
  String? get two_star;
  @override
  String? get one_star;
  @override
  List<ProductReview>? get reviews;
  @override
  @JsonKey(ignore: true)
  _$$ProductDetailsDataImplCopyWith<_$ProductDetailsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) {
  return _ProductReview.fromJson(json);
}

/// @nodoc
mixin _$ProductReview {
  String? get user_name => throw _privateConstructorUsedError;
  String? get user_img => throw _privateConstructorUsedError;
  String? get review_title => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get like => throw _privateConstructorUsedError;
  String? get dislike => throw _privateConstructorUsedError;
  bool? get is_user_certified => throw _privateConstructorUsedError;
  String? get user_location => throw _privateConstructorUsedError;
  String? get review_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReviewCopyWith<ProductReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewCopyWith<$Res> {
  factory $ProductReviewCopyWith(
          ProductReview value, $Res Function(ProductReview) then) =
      _$ProductReviewCopyWithImpl<$Res, ProductReview>;
  @useResult
  $Res call(
      {String? user_name,
      String? user_img,
      String? review_title,
      String? review,
      String? rating,
      String? like,
      String? dislike,
      bool? is_user_certified,
      String? user_location,
      String? review_date});
}

/// @nodoc
class _$ProductReviewCopyWithImpl<$Res, $Val extends ProductReview>
    implements $ProductReviewCopyWith<$Res> {
  _$ProductReviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_name = freezed,
    Object? user_img = freezed,
    Object? review_title = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? like = freezed,
    Object? dislike = freezed,
    Object? is_user_certified = freezed,
    Object? user_location = freezed,
    Object? review_date = freezed,
  }) {
    return _then(_value.copyWith(
      user_name: freezed == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      user_img: freezed == user_img
          ? _value.user_img
          : user_img // ignore: cast_nullable_to_non_nullable
              as String?,
      review_title: freezed == review_title
          ? _value.review_title
          : review_title // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as String?,
      dislike: freezed == dislike
          ? _value.dislike
          : dislike // ignore: cast_nullable_to_non_nullable
              as String?,
      is_user_certified: freezed == is_user_certified
          ? _value.is_user_certified
          : is_user_certified // ignore: cast_nullable_to_non_nullable
              as bool?,
      user_location: freezed == user_location
          ? _value.user_location
          : user_location // ignore: cast_nullable_to_non_nullable
              as String?,
      review_date: freezed == review_date
          ? _value.review_date
          : review_date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductReviewImplCopyWith<$Res>
    implements $ProductReviewCopyWith<$Res> {
  factory _$$ProductReviewImplCopyWith(
          _$ProductReviewImpl value, $Res Function(_$ProductReviewImpl) then) =
      __$$ProductReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? user_name,
      String? user_img,
      String? review_title,
      String? review,
      String? rating,
      String? like,
      String? dislike,
      bool? is_user_certified,
      String? user_location,
      String? review_date});
}

/// @nodoc
class __$$ProductReviewImplCopyWithImpl<$Res>
    extends _$ProductReviewCopyWithImpl<$Res, _$ProductReviewImpl>
    implements _$$ProductReviewImplCopyWith<$Res> {
  __$$ProductReviewImplCopyWithImpl(
      _$ProductReviewImpl _value, $Res Function(_$ProductReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_name = freezed,
    Object? user_img = freezed,
    Object? review_title = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? like = freezed,
    Object? dislike = freezed,
    Object? is_user_certified = freezed,
    Object? user_location = freezed,
    Object? review_date = freezed,
  }) {
    return _then(_$ProductReviewImpl(
      user_name: freezed == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      user_img: freezed == user_img
          ? _value.user_img
          : user_img // ignore: cast_nullable_to_non_nullable
              as String?,
      review_title: freezed == review_title
          ? _value.review_title
          : review_title // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      like: freezed == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as String?,
      dislike: freezed == dislike
          ? _value.dislike
          : dislike // ignore: cast_nullable_to_non_nullable
              as String?,
      is_user_certified: freezed == is_user_certified
          ? _value.is_user_certified
          : is_user_certified // ignore: cast_nullable_to_non_nullable
              as bool?,
      user_location: freezed == user_location
          ? _value.user_location
          : user_location // ignore: cast_nullable_to_non_nullable
              as String?,
      review_date: freezed == review_date
          ? _value.review_date
          : review_date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReviewImpl implements _ProductReview {
  const _$ProductReviewImpl(
      {required this.user_name,
      required this.user_img,
      required this.review_title,
      required this.review,
      required this.rating,
      required this.like,
      required this.dislike,
      required this.is_user_certified,
      required this.user_location,
      required this.review_date});

  factory _$ProductReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReviewImplFromJson(json);

  @override
  final String? user_name;
  @override
  final String? user_img;
  @override
  final String? review_title;
  @override
  final String? review;
  @override
  final String? rating;
  @override
  final String? like;
  @override
  final String? dislike;
  @override
  final bool? is_user_certified;
  @override
  final String? user_location;
  @override
  final String? review_date;

  @override
  String toString() {
    return 'ProductReview(user_name: $user_name, user_img: $user_img, review_title: $review_title, review: $review, rating: $rating, like: $like, dislike: $dislike, is_user_certified: $is_user_certified, user_location: $user_location, review_date: $review_date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewImpl &&
            (identical(other.user_name, user_name) ||
                other.user_name == user_name) &&
            (identical(other.user_img, user_img) ||
                other.user_img == user_img) &&
            (identical(other.review_title, review_title) ||
                other.review_title == review_title) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.dislike, dislike) || other.dislike == dislike) &&
            (identical(other.is_user_certified, is_user_certified) ||
                other.is_user_certified == is_user_certified) &&
            (identical(other.user_location, user_location) ||
                other.user_location == user_location) &&
            (identical(other.review_date, review_date) ||
                other.review_date == review_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user_name,
      user_img,
      review_title,
      review,
      rating,
      like,
      dislike,
      is_user_certified,
      user_location,
      review_date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewImplCopyWith<_$ProductReviewImpl> get copyWith =>
      __$$ProductReviewImplCopyWithImpl<_$ProductReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReviewImplToJson(
      this,
    );
  }
}

abstract class _ProductReview implements ProductReview {
  const factory _ProductReview(
      {required final String? user_name,
      required final String? user_img,
      required final String? review_title,
      required final String? review,
      required final String? rating,
      required final String? like,
      required final String? dislike,
      required final bool? is_user_certified,
      required final String? user_location,
      required final String? review_date}) = _$ProductReviewImpl;

  factory _ProductReview.fromJson(Map<String, dynamic> json) =
      _$ProductReviewImpl.fromJson;

  @override
  String? get user_name;
  @override
  String? get user_img;
  @override
  String? get review_title;
  @override
  String? get review;
  @override
  String? get rating;
  @override
  String? get like;
  @override
  String? get dislike;
  @override
  bool? get is_user_certified;
  @override
  String? get user_location;
  @override
  String? get review_date;
  @override
  @JsonKey(ignore: true)
  _$$ProductReviewImplCopyWith<_$ProductReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
