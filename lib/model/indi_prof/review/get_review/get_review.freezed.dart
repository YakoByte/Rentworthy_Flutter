// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_review.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetReview _$GetReviewFromJson(Map<String, dynamic> json) {
  return _GetReview.fromJson(json);
}

/// @nodoc
mixin _$GetReview {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  ReviewData? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetReviewCopyWith<GetReview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReviewCopyWith<$Res> {
  factory $GetReviewCopyWith(GetReview value, $Res Function(GetReview) then) =
      _$GetReviewCopyWithImpl<$Res, GetReview>;
  @useResult
  $Res call({bool? success, String? message, ReviewData? data});

  $ReviewDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$GetReviewCopyWithImpl<$Res, $Val extends GetReview>
    implements $GetReviewCopyWith<$Res> {
  _$GetReviewCopyWithImpl(this._value, this._then);

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
              as ReviewData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ReviewDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetReviewImplCopyWith<$Res>
    implements $GetReviewCopyWith<$Res> {
  factory _$$GetReviewImplCopyWith(
          _$GetReviewImpl value, $Res Function(_$GetReviewImpl) then) =
      __$$GetReviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, ReviewData? data});

  @override
  $ReviewDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$GetReviewImplCopyWithImpl<$Res>
    extends _$GetReviewCopyWithImpl<$Res, _$GetReviewImpl>
    implements _$$GetReviewImplCopyWith<$Res> {
  __$$GetReviewImplCopyWithImpl(
      _$GetReviewImpl _value, $Res Function(_$GetReviewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetReviewImpl(
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
              as ReviewData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetReviewImpl implements _GetReview {
  const _$GetReviewImpl(
      {required this.success, required this.message, required this.data});

  factory _$GetReviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReviewImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final ReviewData? data;

  @override
  String toString() {
    return 'GetReview(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReviewImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetReviewImplCopyWith<_$GetReviewImpl> get copyWith =>
      __$$GetReviewImplCopyWithImpl<_$GetReviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetReviewImplToJson(
      this,
    );
  }
}

abstract class _GetReview implements GetReview {
  const factory _GetReview(
      {required final bool? success,
      required final String? message,
      required final ReviewData? data}) = _$GetReviewImpl;

  factory _GetReview.fromJson(Map<String, dynamic> json) =
      _$GetReviewImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  ReviewData? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetReviewImplCopyWith<_$GetReviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) {
  return _ReviewData.fromJson(json);
}

/// @nodoc
mixin _$ReviewData {
  String? get total_review => throw _privateConstructorUsedError;
  String? get total_review_count => throw _privateConstructorUsedError;
  String? get five_star => throw _privateConstructorUsedError;
  String? get four_star => throw _privateConstructorUsedError;
  String? get three_star => throw _privateConstructorUsedError;
  String? get two_star => throw _privateConstructorUsedError;
  String? get one_star => throw _privateConstructorUsedError;
  List<ReviewDetails>? get reviews => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewDataCopyWith<ReviewData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDataCopyWith<$Res> {
  factory $ReviewDataCopyWith(
          ReviewData value, $Res Function(ReviewData) then) =
      _$ReviewDataCopyWithImpl<$Res, ReviewData>;
  @useResult
  $Res call(
      {String? total_review,
      String? total_review_count,
      String? five_star,
      String? four_star,
      String? three_star,
      String? two_star,
      String? one_star,
      List<ReviewDetails>? reviews});
}

/// @nodoc
class _$ReviewDataCopyWithImpl<$Res, $Val extends ReviewData>
    implements $ReviewDataCopyWith<$Res> {
  _$ReviewDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_review = freezed,
    Object? total_review_count = freezed,
    Object? five_star = freezed,
    Object? four_star = freezed,
    Object? three_star = freezed,
    Object? two_star = freezed,
    Object? one_star = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_value.copyWith(
      total_review: freezed == total_review
          ? _value.total_review
          : total_review // ignore: cast_nullable_to_non_nullable
              as String?,
      total_review_count: freezed == total_review_count
          ? _value.total_review_count
          : total_review_count // ignore: cast_nullable_to_non_nullable
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
              as List<ReviewDetails>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewDataImplCopyWith<$Res>
    implements $ReviewDataCopyWith<$Res> {
  factory _$$ReviewDataImplCopyWith(
          _$ReviewDataImpl value, $Res Function(_$ReviewDataImpl) then) =
      __$$ReviewDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? total_review,
      String? total_review_count,
      String? five_star,
      String? four_star,
      String? three_star,
      String? two_star,
      String? one_star,
      List<ReviewDetails>? reviews});
}

/// @nodoc
class __$$ReviewDataImplCopyWithImpl<$Res>
    extends _$ReviewDataCopyWithImpl<$Res, _$ReviewDataImpl>
    implements _$$ReviewDataImplCopyWith<$Res> {
  __$$ReviewDataImplCopyWithImpl(
      _$ReviewDataImpl _value, $Res Function(_$ReviewDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_review = freezed,
    Object? total_review_count = freezed,
    Object? five_star = freezed,
    Object? four_star = freezed,
    Object? three_star = freezed,
    Object? two_star = freezed,
    Object? one_star = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_$ReviewDataImpl(
      total_review: freezed == total_review
          ? _value.total_review
          : total_review // ignore: cast_nullable_to_non_nullable
              as String?,
      total_review_count: freezed == total_review_count
          ? _value.total_review_count
          : total_review_count // ignore: cast_nullable_to_non_nullable
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
              as List<ReviewDetails>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewDataImpl implements _ReviewData {
  const _$ReviewDataImpl(
      {required this.total_review,
      required this.total_review_count,
      required this.five_star,
      required this.four_star,
      required this.three_star,
      required this.two_star,
      required this.one_star,
      required final List<ReviewDetails>? reviews})
      : _reviews = reviews;

  factory _$ReviewDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewDataImplFromJson(json);

  @override
  final String? total_review;
  @override
  final String? total_review_count;
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
  final List<ReviewDetails>? _reviews;
  @override
  List<ReviewDetails>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ReviewData(total_review: $total_review, total_review_count: $total_review_count, five_star: $five_star, four_star: $four_star, three_star: $three_star, two_star: $two_star, one_star: $one_star, reviews: $reviews)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewDataImpl &&
            (identical(other.total_review, total_review) ||
                other.total_review == total_review) &&
            (identical(other.total_review_count, total_review_count) ||
                other.total_review_count == total_review_count) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      total_review,
      total_review_count,
      five_star,
      four_star,
      three_star,
      two_star,
      one_star,
      const DeepCollectionEquality().hash(_reviews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewDataImplCopyWith<_$ReviewDataImpl> get copyWith =>
      __$$ReviewDataImplCopyWithImpl<_$ReviewDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewDataImplToJson(
      this,
    );
  }
}

abstract class _ReviewData implements ReviewData {
  const factory _ReviewData(
      {required final String? total_review,
      required final String? total_review_count,
      required final String? five_star,
      required final String? four_star,
      required final String? three_star,
      required final String? two_star,
      required final String? one_star,
      required final List<ReviewDetails>? reviews}) = _$ReviewDataImpl;

  factory _ReviewData.fromJson(Map<String, dynamic> json) =
      _$ReviewDataImpl.fromJson;

  @override
  String? get total_review;
  @override
  String? get total_review_count;
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
  List<ReviewDetails>? get reviews;
  @override
  @JsonKey(ignore: true)
  _$$ReviewDataImplCopyWith<_$ReviewDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewDetails _$ReviewDetailsFromJson(Map<String, dynamic> json) {
  return _ReviewDetails.fromJson(json);
}

/// @nodoc
mixin _$ReviewDetails {
  String? get user_name => throw _privateConstructorUsedError;
  String? get user_img => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  String? get rating => throw _privateConstructorUsedError;
  String? get review_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewDetailsCopyWith<ReviewDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewDetailsCopyWith<$Res> {
  factory $ReviewDetailsCopyWith(
          ReviewDetails value, $Res Function(ReviewDetails) then) =
      _$ReviewDetailsCopyWithImpl<$Res, ReviewDetails>;
  @useResult
  $Res call(
      {String? user_name,
      String? user_img,
      String? review,
      String? rating,
      String? review_date});
}

/// @nodoc
class _$ReviewDetailsCopyWithImpl<$Res, $Val extends ReviewDetails>
    implements $ReviewDetailsCopyWith<$Res> {
  _$ReviewDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_name = freezed,
    Object? user_img = freezed,
    Object? review = freezed,
    Object? rating = freezed,
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
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String?,
      review_date: freezed == review_date
          ? _value.review_date
          : review_date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewDetailsImplCopyWith<$Res>
    implements $ReviewDetailsCopyWith<$Res> {
  factory _$$ReviewDetailsImplCopyWith(
          _$ReviewDetailsImpl value, $Res Function(_$ReviewDetailsImpl) then) =
      __$$ReviewDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? user_name,
      String? user_img,
      String? review,
      String? rating,
      String? review_date});
}

/// @nodoc
class __$$ReviewDetailsImplCopyWithImpl<$Res>
    extends _$ReviewDetailsCopyWithImpl<$Res, _$ReviewDetailsImpl>
    implements _$$ReviewDetailsImplCopyWith<$Res> {
  __$$ReviewDetailsImplCopyWithImpl(
      _$ReviewDetailsImpl _value, $Res Function(_$ReviewDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_name = freezed,
    Object? user_img = freezed,
    Object? review = freezed,
    Object? rating = freezed,
    Object? review_date = freezed,
  }) {
    return _then(_$ReviewDetailsImpl(
      user_name: freezed == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      user_img: freezed == user_img
          ? _value.user_img
          : user_img // ignore: cast_nullable_to_non_nullable
              as String?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
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
class _$ReviewDetailsImpl implements _ReviewDetails {
  const _$ReviewDetailsImpl(
      {required this.user_name,
      required this.user_img,
      required this.review,
      required this.rating,
      required this.review_date});

  factory _$ReviewDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewDetailsImplFromJson(json);

  @override
  final String? user_name;
  @override
  final String? user_img;
  @override
  final String? review;
  @override
  final String? rating;
  @override
  final String? review_date;

  @override
  String toString() {
    return 'ReviewDetails(user_name: $user_name, user_img: $user_img, review: $review, rating: $rating, review_date: $review_date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewDetailsImpl &&
            (identical(other.user_name, user_name) ||
                other.user_name == user_name) &&
            (identical(other.user_img, user_img) ||
                other.user_img == user_img) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review_date, review_date) ||
                other.review_date == review_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, user_name, user_img, review, rating, review_date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewDetailsImplCopyWith<_$ReviewDetailsImpl> get copyWith =>
      __$$ReviewDetailsImplCopyWithImpl<_$ReviewDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewDetailsImplToJson(
      this,
    );
  }
}

abstract class _ReviewDetails implements ReviewDetails {
  const factory _ReviewDetails(
      {required final String? user_name,
      required final String? user_img,
      required final String? review,
      required final String? rating,
      required final String? review_date}) = _$ReviewDetailsImpl;

  factory _ReviewDetails.fromJson(Map<String, dynamic> json) =
      _$ReviewDetailsImpl.fromJson;

  @override
  String? get user_name;
  @override
  String? get user_img;
  @override
  String? get review;
  @override
  String? get rating;
  @override
  String? get review_date;
  @override
  @JsonKey(ignore: true)
  _$$ReviewDetailsImplCopyWith<_$ReviewDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
