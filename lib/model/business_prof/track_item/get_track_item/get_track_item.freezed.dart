// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_track_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TrackingItemResponse _$TrackingItemResponseFromJson(Map<String, dynamic> json) {
  return _TrackingItemResponse.fromJson(json);
}

/// @nodoc
mixin _$TrackingItemResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<TrackingItemData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackingItemResponseCopyWith<TrackingItemResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingItemResponseCopyWith<$Res> {
  factory $TrackingItemResponseCopyWith(TrackingItemResponse value,
          $Res Function(TrackingItemResponse) then) =
      _$TrackingItemResponseCopyWithImpl<$Res, TrackingItemResponse>;
  @useResult
  $Res call({bool? success, String? message, List<TrackingItemData>? data});
}

/// @nodoc
class _$TrackingItemResponseCopyWithImpl<$Res,
        $Val extends TrackingItemResponse>
    implements $TrackingItemResponseCopyWith<$Res> {
  _$TrackingItemResponseCopyWithImpl(this._value, this._then);

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
              as List<TrackingItemData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingItemResponseImplCopyWith<$Res>
    implements $TrackingItemResponseCopyWith<$Res> {
  factory _$$TrackingItemResponseImplCopyWith(_$TrackingItemResponseImpl value,
          $Res Function(_$TrackingItemResponseImpl) then) =
      __$$TrackingItemResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<TrackingItemData>? data});
}

/// @nodoc
class __$$TrackingItemResponseImplCopyWithImpl<$Res>
    extends _$TrackingItemResponseCopyWithImpl<$Res, _$TrackingItemResponseImpl>
    implements _$$TrackingItemResponseImplCopyWith<$Res> {
  __$$TrackingItemResponseImplCopyWithImpl(_$TrackingItemResponseImpl _value,
      $Res Function(_$TrackingItemResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$TrackingItemResponseImpl(
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
              as List<TrackingItemData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingItemResponseImpl implements _TrackingItemResponse {
  const _$TrackingItemResponseImpl(
      {required this.success,
      required this.message,
      required final List<TrackingItemData>? data})
      : _data = data;

  factory _$TrackingItemResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingItemResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<TrackingItemData>? _data;
  @override
  List<TrackingItemData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TrackingItemResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingItemResponseImpl &&
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
  _$$TrackingItemResponseImplCopyWith<_$TrackingItemResponseImpl>
      get copyWith =>
          __$$TrackingItemResponseImplCopyWithImpl<_$TrackingItemResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingItemResponseImplToJson(
      this,
    );
  }
}

abstract class _TrackingItemResponse implements TrackingItemResponse {
  const factory _TrackingItemResponse(
          {required final bool? success,
          required final String? message,
          required final List<TrackingItemData>? data}) =
      _$TrackingItemResponseImpl;

  factory _TrackingItemResponse.fromJson(Map<String, dynamic> json) =
      _$TrackingItemResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<TrackingItemData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$TrackingItemResponseImplCopyWith<_$TrackingItemResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

TrackingItemData _$TrackingItemDataFromJson(Map<String, dynamic> json) {
  return _TrackingItemData.fromJson(json);
}

/// @nodoc
mixin _$TrackingItemData {
  String? get track_item_id => throw _privateConstructorUsedError;
  String? get product_name => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get track_type => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  String? get order_place_date => throw _privateConstructorUsedError;
  String? get renter_name => throw _privateConstructorUsedError;
  String? get order_id => throw _privateConstructorUsedError;
  String? get order_status => throw _privateConstructorUsedError;
  String? get shipping_address => throw _privateConstructorUsedError;
  String? get payment_method => throw _privateConstructorUsedError;
  String? get item_subtotal => throw _privateConstructorUsedError;
  String? get item_total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TrackingItemDataCopyWith<TrackingItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackingItemDataCopyWith<$Res> {
  factory $TrackingItemDataCopyWith(
          TrackingItemData value, $Res Function(TrackingItemData) then) =
      _$TrackingItemDataCopyWithImpl<$Res, TrackingItemData>;
  @useResult
  $Res call(
      {String? track_item_id,
      String? product_name,
      String? desc,
      String? track_type,
      String? thumbnail,
      String? order_place_date,
      String? renter_name,
      String? order_id,
      String? order_status,
      String? shipping_address,
      String? payment_method,
      String? item_subtotal,
      String? item_total});
}

/// @nodoc
class _$TrackingItemDataCopyWithImpl<$Res, $Val extends TrackingItemData>
    implements $TrackingItemDataCopyWith<$Res> {
  _$TrackingItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track_item_id = freezed,
    Object? product_name = freezed,
    Object? desc = freezed,
    Object? track_type = freezed,
    Object? thumbnail = freezed,
    Object? order_place_date = freezed,
    Object? renter_name = freezed,
    Object? order_id = freezed,
    Object? order_status = freezed,
    Object? shipping_address = freezed,
    Object? payment_method = freezed,
    Object? item_subtotal = freezed,
    Object? item_total = freezed,
  }) {
    return _then(_value.copyWith(
      track_item_id: freezed == track_item_id
          ? _value.track_item_id
          : track_item_id // ignore: cast_nullable_to_non_nullable
              as String?,
      product_name: freezed == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      track_type: freezed == track_type
          ? _value.track_type
          : track_type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      order_place_date: freezed == order_place_date
          ? _value.order_place_date
          : order_place_date // ignore: cast_nullable_to_non_nullable
              as String?,
      renter_name: freezed == renter_name
          ? _value.renter_name
          : renter_name // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status: freezed == order_status
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      shipping_address: freezed == shipping_address
          ? _value.shipping_address
          : shipping_address // ignore: cast_nullable_to_non_nullable
              as String?,
      payment_method: freezed == payment_method
          ? _value.payment_method
          : payment_method // ignore: cast_nullable_to_non_nullable
              as String?,
      item_subtotal: freezed == item_subtotal
          ? _value.item_subtotal
          : item_subtotal // ignore: cast_nullable_to_non_nullable
              as String?,
      item_total: freezed == item_total
          ? _value.item_total
          : item_total // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrackingItemDataImplCopyWith<$Res>
    implements $TrackingItemDataCopyWith<$Res> {
  factory _$$TrackingItemDataImplCopyWith(_$TrackingItemDataImpl value,
          $Res Function(_$TrackingItemDataImpl) then) =
      __$$TrackingItemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? track_item_id,
      String? product_name,
      String? desc,
      String? track_type,
      String? thumbnail,
      String? order_place_date,
      String? renter_name,
      String? order_id,
      String? order_status,
      String? shipping_address,
      String? payment_method,
      String? item_subtotal,
      String? item_total});
}

/// @nodoc
class __$$TrackingItemDataImplCopyWithImpl<$Res>
    extends _$TrackingItemDataCopyWithImpl<$Res, _$TrackingItemDataImpl>
    implements _$$TrackingItemDataImplCopyWith<$Res> {
  __$$TrackingItemDataImplCopyWithImpl(_$TrackingItemDataImpl _value,
      $Res Function(_$TrackingItemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? track_item_id = freezed,
    Object? product_name = freezed,
    Object? desc = freezed,
    Object? track_type = freezed,
    Object? thumbnail = freezed,
    Object? order_place_date = freezed,
    Object? renter_name = freezed,
    Object? order_id = freezed,
    Object? order_status = freezed,
    Object? shipping_address = freezed,
    Object? payment_method = freezed,
    Object? item_subtotal = freezed,
    Object? item_total = freezed,
  }) {
    return _then(_$TrackingItemDataImpl(
      track_item_id: freezed == track_item_id
          ? _value.track_item_id
          : track_item_id // ignore: cast_nullable_to_non_nullable
              as String?,
      product_name: freezed == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      track_type: freezed == track_type
          ? _value.track_type
          : track_type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      order_place_date: freezed == order_place_date
          ? _value.order_place_date
          : order_place_date // ignore: cast_nullable_to_non_nullable
              as String?,
      renter_name: freezed == renter_name
          ? _value.renter_name
          : renter_name // ignore: cast_nullable_to_non_nullable
              as String?,
      order_id: freezed == order_id
          ? _value.order_id
          : order_id // ignore: cast_nullable_to_non_nullable
              as String?,
      order_status: freezed == order_status
          ? _value.order_status
          : order_status // ignore: cast_nullable_to_non_nullable
              as String?,
      shipping_address: freezed == shipping_address
          ? _value.shipping_address
          : shipping_address // ignore: cast_nullable_to_non_nullable
              as String?,
      payment_method: freezed == payment_method
          ? _value.payment_method
          : payment_method // ignore: cast_nullable_to_non_nullable
              as String?,
      item_subtotal: freezed == item_subtotal
          ? _value.item_subtotal
          : item_subtotal // ignore: cast_nullable_to_non_nullable
              as String?,
      item_total: freezed == item_total
          ? _value.item_total
          : item_total // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackingItemDataImpl implements _TrackingItemData {
  const _$TrackingItemDataImpl(
      {required this.track_item_id,
      required this.product_name,
      required this.desc,
      required this.track_type,
      required this.thumbnail,
      required this.order_place_date,
      required this.renter_name,
      required this.order_id,
      required this.order_status,
      required this.shipping_address,
      required this.payment_method,
      required this.item_subtotal,
      required this.item_total});

  factory _$TrackingItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackingItemDataImplFromJson(json);

  @override
  final String? track_item_id;
  @override
  final String? product_name;
  @override
  final String? desc;
  @override
  final String? track_type;
  @override
  final String? thumbnail;
  @override
  final String? order_place_date;
  @override
  final String? renter_name;
  @override
  final String? order_id;
  @override
  final String? order_status;
  @override
  final String? shipping_address;
  @override
  final String? payment_method;
  @override
  final String? item_subtotal;
  @override
  final String? item_total;

  @override
  String toString() {
    return 'TrackingItemData(track_item_id: $track_item_id, product_name: $product_name, desc: $desc, track_type: $track_type, thumbnail: $thumbnail, order_place_date: $order_place_date, renter_name: $renter_name, order_id: $order_id, order_status: $order_status, shipping_address: $shipping_address, payment_method: $payment_method, item_subtotal: $item_subtotal, item_total: $item_total)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackingItemDataImpl &&
            (identical(other.track_item_id, track_item_id) ||
                other.track_item_id == track_item_id) &&
            (identical(other.product_name, product_name) ||
                other.product_name == product_name) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.track_type, track_type) ||
                other.track_type == track_type) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.order_place_date, order_place_date) ||
                other.order_place_date == order_place_date) &&
            (identical(other.renter_name, renter_name) ||
                other.renter_name == renter_name) &&
            (identical(other.order_id, order_id) ||
                other.order_id == order_id) &&
            (identical(other.order_status, order_status) ||
                other.order_status == order_status) &&
            (identical(other.shipping_address, shipping_address) ||
                other.shipping_address == shipping_address) &&
            (identical(other.payment_method, payment_method) ||
                other.payment_method == payment_method) &&
            (identical(other.item_subtotal, item_subtotal) ||
                other.item_subtotal == item_subtotal) &&
            (identical(other.item_total, item_total) ||
                other.item_total == item_total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      track_item_id,
      product_name,
      desc,
      track_type,
      thumbnail,
      order_place_date,
      renter_name,
      order_id,
      order_status,
      shipping_address,
      payment_method,
      item_subtotal,
      item_total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackingItemDataImplCopyWith<_$TrackingItemDataImpl> get copyWith =>
      __$$TrackingItemDataImplCopyWithImpl<_$TrackingItemDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackingItemDataImplToJson(
      this,
    );
  }
}

abstract class _TrackingItemData implements TrackingItemData {
  const factory _TrackingItemData(
      {required final String? track_item_id,
      required final String? product_name,
      required final String? desc,
      required final String? track_type,
      required final String? thumbnail,
      required final String? order_place_date,
      required final String? renter_name,
      required final String? order_id,
      required final String? order_status,
      required final String? shipping_address,
      required final String? payment_method,
      required final String? item_subtotal,
      required final String? item_total}) = _$TrackingItemDataImpl;

  factory _TrackingItemData.fromJson(Map<String, dynamic> json) =
      _$TrackingItemDataImpl.fromJson;

  @override
  String? get track_item_id;
  @override
  String? get product_name;
  @override
  String? get desc;
  @override
  String? get track_type;
  @override
  String? get thumbnail;
  @override
  String? get order_place_date;
  @override
  String? get renter_name;
  @override
  String? get order_id;
  @override
  String? get order_status;
  @override
  String? get shipping_address;
  @override
  String? get payment_method;
  @override
  String? get item_subtotal;
  @override
  String? get item_total;
  @override
  @JsonKey(ignore: true)
  _$$TrackingItemDataImplCopyWith<_$TrackingItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
