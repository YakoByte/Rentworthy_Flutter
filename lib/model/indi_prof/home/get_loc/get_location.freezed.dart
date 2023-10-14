// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetLocation _$GetLocationFromJson(Map<String, dynamic> json) {
  return _GetLocation.fromJson(json);
}

/// @nodoc
mixin _$GetLocation {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<GetLocData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetLocationCopyWith<GetLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLocationCopyWith<$Res> {
  factory $GetLocationCopyWith(
          GetLocation value, $Res Function(GetLocation) then) =
      _$GetLocationCopyWithImpl<$Res, GetLocation>;
  @useResult
  $Res call({bool? success, String? message, List<GetLocData>? data});
}

/// @nodoc
class _$GetLocationCopyWithImpl<$Res, $Val extends GetLocation>
    implements $GetLocationCopyWith<$Res> {
  _$GetLocationCopyWithImpl(this._value, this._then);

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
              as List<GetLocData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLocationImplCopyWith<$Res>
    implements $GetLocationCopyWith<$Res> {
  factory _$$GetLocationImplCopyWith(
          _$GetLocationImpl value, $Res Function(_$GetLocationImpl) then) =
      __$$GetLocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<GetLocData>? data});
}

/// @nodoc
class __$$GetLocationImplCopyWithImpl<$Res>
    extends _$GetLocationCopyWithImpl<$Res, _$GetLocationImpl>
    implements _$$GetLocationImplCopyWith<$Res> {
  __$$GetLocationImplCopyWithImpl(
      _$GetLocationImpl _value, $Res Function(_$GetLocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetLocationImpl(
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
              as List<GetLocData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetLocationImpl implements _GetLocation {
  const _$GetLocationImpl(
      {required this.success,
      required this.message,
      required final List<GetLocData>? data})
      : _data = data;

  factory _$GetLocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetLocationImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<GetLocData>? _data;
  @override
  List<GetLocData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetLocation(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLocationImpl &&
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
  _$$GetLocationImplCopyWith<_$GetLocationImpl> get copyWith =>
      __$$GetLocationImplCopyWithImpl<_$GetLocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetLocationImplToJson(
      this,
    );
  }
}

abstract class _GetLocation implements GetLocation {
  const factory _GetLocation(
      {required final bool? success,
      required final String? message,
      required final List<GetLocData>? data}) = _$GetLocationImpl;

  factory _GetLocation.fromJson(Map<String, dynamic> json) =
      _$GetLocationImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<GetLocData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetLocationImplCopyWith<_$GetLocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetLocData _$GetLocDataFromJson(Map<String, dynamic> json) {
  return _GetLocData.fromJson(json);
}

/// @nodoc
mixin _$GetLocData {
  String? get loc_id => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get lat => throw _privateConstructorUsedError;
  String? get long => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetLocDataCopyWith<GetLocData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLocDataCopyWith<$Res> {
  factory $GetLocDataCopyWith(
          GetLocData value, $Res Function(GetLocData) then) =
      _$GetLocDataCopyWithImpl<$Res, GetLocData>;
  @useResult
  $Res call({String? loc_id, String? location, String? lat, String? long});
}

/// @nodoc
class _$GetLocDataCopyWithImpl<$Res, $Val extends GetLocData>
    implements $GetLocDataCopyWith<$Res> {
  _$GetLocDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loc_id = freezed,
    Object? location = freezed,
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_value.copyWith(
      loc_id: freezed == loc_id
          ? _value.loc_id
          : loc_id // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetLocDataImplCopyWith<$Res>
    implements $GetLocDataCopyWith<$Res> {
  factory _$$GetLocDataImplCopyWith(
          _$GetLocDataImpl value, $Res Function(_$GetLocDataImpl) then) =
      __$$GetLocDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? loc_id, String? location, String? lat, String? long});
}

/// @nodoc
class __$$GetLocDataImplCopyWithImpl<$Res>
    extends _$GetLocDataCopyWithImpl<$Res, _$GetLocDataImpl>
    implements _$$GetLocDataImplCopyWith<$Res> {
  __$$GetLocDataImplCopyWithImpl(
      _$GetLocDataImpl _value, $Res Function(_$GetLocDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loc_id = freezed,
    Object? location = freezed,
    Object? lat = freezed,
    Object? long = freezed,
  }) {
    return _then(_$GetLocDataImpl(
      loc_id: freezed == loc_id
          ? _value.loc_id
          : loc_id // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetLocDataImpl implements _GetLocData {
  const _$GetLocDataImpl(
      {required this.loc_id,
      required this.location,
      required this.lat,
      required this.long});

  factory _$GetLocDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetLocDataImplFromJson(json);

  @override
  final String? loc_id;
  @override
  final String? location;
  @override
  final String? lat;
  @override
  final String? long;

  @override
  String toString() {
    return 'GetLocData(loc_id: $loc_id, location: $location, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLocDataImpl &&
            (identical(other.loc_id, loc_id) || other.loc_id == loc_id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, loc_id, location, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLocDataImplCopyWith<_$GetLocDataImpl> get copyWith =>
      __$$GetLocDataImplCopyWithImpl<_$GetLocDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetLocDataImplToJson(
      this,
    );
  }
}

abstract class _GetLocData implements GetLocData {
  const factory _GetLocData(
      {required final String? loc_id,
      required final String? location,
      required final String? lat,
      required final String? long}) = _$GetLocDataImpl;

  factory _GetLocData.fromJson(Map<String, dynamic> json) =
      _$GetLocDataImpl.fromJson;

  @override
  String? get loc_id;
  @override
  String? get location;
  @override
  String? get lat;
  @override
  String? get long;
  @override
  @JsonKey(ignore: true)
  _$$GetLocDataImplCopyWith<_$GetLocDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
