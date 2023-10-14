// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetItem _$GetItemFromJson(Map<String, dynamic> json) {
  return _GetItem.fromJson(json);
}

/// @nodoc
mixin _$GetItem {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ItemData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetItemCopyWith<GetItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetItemCopyWith<$Res> {
  factory $GetItemCopyWith(GetItem value, $Res Function(GetItem) then) =
      _$GetItemCopyWithImpl<$Res, GetItem>;
  @useResult
  $Res call({bool? success, String? message, List<ItemData>? data});
}

/// @nodoc
class _$GetItemCopyWithImpl<$Res, $Val extends GetItem>
    implements $GetItemCopyWith<$Res> {
  _$GetItemCopyWithImpl(this._value, this._then);

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
              as List<ItemData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetItemImplCopyWith<$Res> implements $GetItemCopyWith<$Res> {
  factory _$$GetItemImplCopyWith(
          _$GetItemImpl value, $Res Function(_$GetItemImpl) then) =
      __$$GetItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<ItemData>? data});
}

/// @nodoc
class __$$GetItemImplCopyWithImpl<$Res>
    extends _$GetItemCopyWithImpl<$Res, _$GetItemImpl>
    implements _$$GetItemImplCopyWith<$Res> {
  __$$GetItemImplCopyWithImpl(
      _$GetItemImpl _value, $Res Function(_$GetItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetItemImpl(
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
              as List<ItemData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetItemImpl implements _GetItem {
  const _$GetItemImpl(
      {required this.success,
      required this.message,
      required final List<ItemData>? data})
      : _data = data;

  factory _$GetItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetItemImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<ItemData>? _data;
  @override
  List<ItemData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetItem(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetItemImpl &&
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
  _$$GetItemImplCopyWith<_$GetItemImpl> get copyWith =>
      __$$GetItemImplCopyWithImpl<_$GetItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetItemImplToJson(
      this,
    );
  }
}

abstract class _GetItem implements GetItem {
  const factory _GetItem(
      {required final bool? success,
      required final String? message,
      required final List<ItemData>? data}) = _$GetItemImpl;

  factory _GetItem.fromJson(Map<String, dynamic> json) = _$GetItemImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<ItemData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetItemImplCopyWith<_$GetItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ItemData _$ItemDataFromJson(Map<String, dynamic> json) {
  return _ItemData.fromJson(json);
}

/// @nodoc
mixin _$ItemData {
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
  bool? get isfav => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemDataCopyWith<ItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemDataCopyWith<$Res> {
  factory $ItemDataCopyWith(ItemData value, $Res Function(ItemData) then) =
      _$ItemDataCopyWithImpl<$Res, ItemData>;
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
      bool? isfav});
}

/// @nodoc
class _$ItemDataCopyWithImpl<$Res, $Val extends ItemData>
    implements $ItemDataCopyWith<$Res> {
  _$ItemDataCopyWithImpl(this._value, this._then);

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
    Object? isfav = freezed,
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
      isfav: freezed == isfav
          ? _value.isfav
          : isfav // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemDataImplCopyWith<$Res>
    implements $ItemDataCopyWith<$Res> {
  factory _$$ItemDataImplCopyWith(
          _$ItemDataImpl value, $Res Function(_$ItemDataImpl) then) =
      __$$ItemDataImplCopyWithImpl<$Res>;
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
      bool? isfav});
}

/// @nodoc
class __$$ItemDataImplCopyWithImpl<$Res>
    extends _$ItemDataCopyWithImpl<$Res, _$ItemDataImpl>
    implements _$$ItemDataImplCopyWith<$Res> {
  __$$ItemDataImplCopyWithImpl(
      _$ItemDataImpl _value, $Res Function(_$ItemDataImpl) _then)
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
    Object? isfav = freezed,
  }) {
    return _then(_$ItemDataImpl(
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
      isfav: freezed == isfav
          ? _value.isfav
          : isfav // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemDataImpl implements _ItemData {
  const _$ItemDataImpl(
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
      required this.isfav})
      : _imgs = imgs;

  factory _$ItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDataImplFromJson(json);

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
  final bool? isfav;

  @override
  String toString() {
    return 'ItemData(id: $id, name: $name, imgs: $imgs, thumbnail: $thumbnail, desc: $desc, location: $location, time_period: $time_period, lat: $lat, long: $long, link: $link, price: $price, isfav: $isfav)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemDataImpl &&
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
            (identical(other.isfav, isfav) || other.isfav == isfav));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
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
      isfav);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemDataImplCopyWith<_$ItemDataImpl> get copyWith =>
      __$$ItemDataImplCopyWithImpl<_$ItemDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDataImplToJson(
      this,
    );
  }
}

abstract class _ItemData implements ItemData {
  const factory _ItemData(
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
      required final bool? isfav}) = _$ItemDataImpl;

  factory _ItemData.fromJson(Map<String, dynamic> json) =
      _$ItemDataImpl.fromJson;

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
  bool? get isfav;
  @override
  @JsonKey(ignore: true)
  _$$ItemDataImplCopyWith<_$ItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
