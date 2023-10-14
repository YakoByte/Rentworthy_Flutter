// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_booked_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetBookedOrder _$GetBookedOrderFromJson(Map<String, dynamic> json) {
  return _GetBookedOrder.fromJson(json);
}

/// @nodoc
mixin _$GetBookedOrder {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<BookedProduct>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetBookedOrderCopyWith<GetBookedOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBookedOrderCopyWith<$Res> {
  factory $GetBookedOrderCopyWith(
          GetBookedOrder value, $Res Function(GetBookedOrder) then) =
      _$GetBookedOrderCopyWithImpl<$Res, GetBookedOrder>;
  @useResult
  $Res call({bool? success, String? message, List<BookedProduct>? data});
}

/// @nodoc
class _$GetBookedOrderCopyWithImpl<$Res, $Val extends GetBookedOrder>
    implements $GetBookedOrderCopyWith<$Res> {
  _$GetBookedOrderCopyWithImpl(this._value, this._then);

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
              as List<BookedProduct>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetBookedOrderImplCopyWith<$Res>
    implements $GetBookedOrderCopyWith<$Res> {
  factory _$$GetBookedOrderImplCopyWith(_$GetBookedOrderImpl value,
          $Res Function(_$GetBookedOrderImpl) then) =
      __$$GetBookedOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<BookedProduct>? data});
}

/// @nodoc
class __$$GetBookedOrderImplCopyWithImpl<$Res>
    extends _$GetBookedOrderCopyWithImpl<$Res, _$GetBookedOrderImpl>
    implements _$$GetBookedOrderImplCopyWith<$Res> {
  __$$GetBookedOrderImplCopyWithImpl(
      _$GetBookedOrderImpl _value, $Res Function(_$GetBookedOrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetBookedOrderImpl(
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
              as List<BookedProduct>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetBookedOrderImpl implements _GetBookedOrder {
  const _$GetBookedOrderImpl(
      {required this.success,
      required this.message,
      required final List<BookedProduct>? data})
      : _data = data;

  factory _$GetBookedOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetBookedOrderImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<BookedProduct>? _data;
  @override
  List<BookedProduct>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetBookedOrder(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBookedOrderImpl &&
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
  _$$GetBookedOrderImplCopyWith<_$GetBookedOrderImpl> get copyWith =>
      __$$GetBookedOrderImplCopyWithImpl<_$GetBookedOrderImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetBookedOrderImplToJson(
      this,
    );
  }
}

abstract class _GetBookedOrder implements GetBookedOrder {
  const factory _GetBookedOrder(
      {required final bool? success,
      required final String? message,
      required final List<BookedProduct>? data}) = _$GetBookedOrderImpl;

  factory _GetBookedOrder.fromJson(Map<String, dynamic> json) =
      _$GetBookedOrderImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<BookedProduct>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetBookedOrderImplCopyWith<_$GetBookedOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookedProduct _$BookedProductFromJson(Map<String, dynamic> json) {
  return _BookedProduct.fromJson(json);
}

/// @nodoc
mixin _$BookedProduct {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get delivery_location => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get product_chat_id => throw _privateConstructorUsedError;
  String? get seller_id => throw _privateConstructorUsedError;
  String? get seller_name => throw _privateConstructorUsedError;
  String? get seller_img => throw _privateConstructorUsedError;
  String? get posted_on => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookedProductCopyWith<BookedProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookedProductCopyWith<$Res> {
  factory $BookedProductCopyWith(
          BookedProduct value, $Res Function(BookedProduct) then) =
      _$BookedProductCopyWithImpl<$Res, BookedProduct>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? thumbnail,
      String? desc,
      String? delivery_location,
      String? lat,
      String? long,
      String? price,
      String? product_chat_id,
      String? seller_id,
      String? seller_name,
      String? seller_img,
      String? posted_on});
}

/// @nodoc
class _$BookedProductCopyWithImpl<$Res, $Val extends BookedProduct>
    implements $BookedProductCopyWith<$Res> {
  _$BookedProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? thumbnail = freezed,
    Object? desc = freezed,
    Object? delivery_location = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? price = freezed,
    Object? product_chat_id = freezed,
    Object? seller_id = freezed,
    Object? seller_name = freezed,
    Object? seller_img = freezed,
    Object? posted_on = freezed,
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
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_location: freezed == delivery_location
          ? _value.delivery_location
          : delivery_location // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      product_chat_id: freezed == product_chat_id
          ? _value.product_chat_id
          : product_chat_id // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookedProductImplCopyWith<$Res>
    implements $BookedProductCopyWith<$Res> {
  factory _$$BookedProductImplCopyWith(
          _$BookedProductImpl value, $Res Function(_$BookedProductImpl) then) =
      __$$BookedProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? thumbnail,
      String? desc,
      String? delivery_location,
      String? lat,
      String? long,
      String? price,
      String? product_chat_id,
      String? seller_id,
      String? seller_name,
      String? seller_img,
      String? posted_on});
}

/// @nodoc
class __$$BookedProductImplCopyWithImpl<$Res>
    extends _$BookedProductCopyWithImpl<$Res, _$BookedProductImpl>
    implements _$$BookedProductImplCopyWith<$Res> {
  __$$BookedProductImplCopyWithImpl(
      _$BookedProductImpl _value, $Res Function(_$BookedProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? thumbnail = freezed,
    Object? desc = freezed,
    Object? delivery_location = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? price = freezed,
    Object? product_chat_id = freezed,
    Object? seller_id = freezed,
    Object? seller_name = freezed,
    Object? seller_img = freezed,
    Object? posted_on = freezed,
  }) {
    return _then(_$BookedProductImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery_location: freezed == delivery_location
          ? _value.delivery_location
          : delivery_location // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      product_chat_id: freezed == product_chat_id
          ? _value.product_chat_id
          : product_chat_id // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookedProductImpl implements _BookedProduct {
  const _$BookedProductImpl(
      {required this.id,
      required this.name,
      required this.thumbnail,
      required this.desc,
      required this.delivery_location,
      required this.lat,
      required this.long,
      required this.price,
      required this.product_chat_id,
      required this.seller_id,
      required this.seller_name,
      required this.seller_img,
      required this.posted_on});

  factory _$BookedProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookedProductImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? thumbnail;
  @override
  final String? desc;
  @override
  final String? delivery_location;
  @override
  final String? lat;
  @override
  final String? long;
  @override
  final String? price;
  @override
  final String? product_chat_id;
  @override
  final String? seller_id;
  @override
  final String? seller_name;
  @override
  final String? seller_img;
  @override
  final String? posted_on;

  @override
  String toString() {
    return 'BookedProduct(id: $id, name: $name, thumbnail: $thumbnail, desc: $desc, delivery_location: $delivery_location, lat: $lat, long: $long, price: $price, product_chat_id: $product_chat_id, seller_id: $seller_id, seller_name: $seller_name, seller_img: $seller_img, posted_on: $posted_on)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookedProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.delivery_location, delivery_location) ||
                other.delivery_location == delivery_location) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.product_chat_id, product_chat_id) ||
                other.product_chat_id == product_chat_id) &&
            (identical(other.seller_id, seller_id) ||
                other.seller_id == seller_id) &&
            (identical(other.seller_name, seller_name) ||
                other.seller_name == seller_name) &&
            (identical(other.seller_img, seller_img) ||
                other.seller_img == seller_img) &&
            (identical(other.posted_on, posted_on) ||
                other.posted_on == posted_on));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      thumbnail,
      desc,
      delivery_location,
      lat,
      long,
      price,
      product_chat_id,
      seller_id,
      seller_name,
      seller_img,
      posted_on);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookedProductImplCopyWith<_$BookedProductImpl> get copyWith =>
      __$$BookedProductImplCopyWithImpl<_$BookedProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookedProductImplToJson(
      this,
    );
  }
}

abstract class _BookedProduct implements BookedProduct {
  const factory _BookedProduct(
      {required final String? id,
      required final String? name,
      required final String? thumbnail,
      required final String? desc,
      required final String? delivery_location,
      required final String? lat,
      required final String? long,
      required final String? price,
      required final String? product_chat_id,
      required final String? seller_id,
      required final String? seller_name,
      required final String? seller_img,
      required final String? posted_on}) = _$BookedProductImpl;

  factory _BookedProduct.fromJson(Map<String, dynamic> json) =
      _$BookedProductImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get thumbnail;
  @override
  String? get desc;
  @override
  String? get delivery_location;
  @override
  String? get lat;
  @override
  String? get long;
  @override
  String? get price;
  @override
  String? get product_chat_id;
  @override
  String? get seller_id;
  @override
  String? get seller_name;
  @override
  String? get seller_img;
  @override
  String? get posted_on;
  @override
  @JsonKey(ignore: true)
  _$$BookedProductImplCopyWith<_$BookedProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
