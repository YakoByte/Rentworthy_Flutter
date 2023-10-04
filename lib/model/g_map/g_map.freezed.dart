// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'g_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GMapResponse _$GMapResponseFromJson(Map<String, dynamic> json) {
  return _GMapResponse.fromJson(json);
}

/// @nodoc
mixin _$GMapResponse {
  List<Office>? get offices => throw _privateConstructorUsedError;
  List<Region>? get regions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GMapResponseCopyWith<GMapResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GMapResponseCopyWith<$Res> {
  factory $GMapResponseCopyWith(
          GMapResponse value, $Res Function(GMapResponse) then) =
      _$GMapResponseCopyWithImpl<$Res, GMapResponse>;
  @useResult
  $Res call({List<Office>? offices, List<Region>? regions});
}

/// @nodoc
class _$GMapResponseCopyWithImpl<$Res, $Val extends GMapResponse>
    implements $GMapResponseCopyWith<$Res> {
  _$GMapResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offices = freezed,
    Object? regions = freezed,
  }) {
    return _then(_value.copyWith(
      offices: freezed == offices
          ? _value.offices
          : offices // ignore: cast_nullable_to_non_nullable
              as List<Office>?,
      regions: freezed == regions
          ? _value.regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GMapResponseImplCopyWith<$Res>
    implements $GMapResponseCopyWith<$Res> {
  factory _$$GMapResponseImplCopyWith(
          _$GMapResponseImpl value, $Res Function(_$GMapResponseImpl) then) =
      __$$GMapResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Office>? offices, List<Region>? regions});
}

/// @nodoc
class __$$GMapResponseImplCopyWithImpl<$Res>
    extends _$GMapResponseCopyWithImpl<$Res, _$GMapResponseImpl>
    implements _$$GMapResponseImplCopyWith<$Res> {
  __$$GMapResponseImplCopyWithImpl(
      _$GMapResponseImpl _value, $Res Function(_$GMapResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offices = freezed,
    Object? regions = freezed,
  }) {
    return _then(_$GMapResponseImpl(
      offices: freezed == offices
          ? _value._offices
          : offices // ignore: cast_nullable_to_non_nullable
              as List<Office>?,
      regions: freezed == regions
          ? _value._regions
          : regions // ignore: cast_nullable_to_non_nullable
              as List<Region>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GMapResponseImpl implements _GMapResponse {
  const _$GMapResponseImpl(
      {required final List<Office>? offices,
      required final List<Region>? regions})
      : _offices = offices,
        _regions = regions;

  factory _$GMapResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GMapResponseImplFromJson(json);

  final List<Office>? _offices;
  @override
  List<Office>? get offices {
    final value = _offices;
    if (value == null) return null;
    if (_offices is EqualUnmodifiableListView) return _offices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Region>? _regions;
  @override
  List<Region>? get regions {
    final value = _regions;
    if (value == null) return null;
    if (_regions is EqualUnmodifiableListView) return _regions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GMapResponse(offices: $offices, regions: $regions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GMapResponseImpl &&
            const DeepCollectionEquality().equals(other._offices, _offices) &&
            const DeepCollectionEquality().equals(other._regions, _regions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_offices),
      const DeepCollectionEquality().hash(_regions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GMapResponseImplCopyWith<_$GMapResponseImpl> get copyWith =>
      __$$GMapResponseImplCopyWithImpl<_$GMapResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GMapResponseImplToJson(
      this,
    );
  }
}

abstract class _GMapResponse implements GMapResponse {
  const factory _GMapResponse(
      {required final List<Office>? offices,
      required final List<Region>? regions}) = _$GMapResponseImpl;

  factory _GMapResponse.fromJson(Map<String, dynamic> json) =
      _$GMapResponseImpl.fromJson;

  @override
  List<Office>? get offices;
  @override
  List<Region>? get regions;
  @override
  @JsonKey(ignore: true)
  _$$GMapResponseImplCopyWith<_$GMapResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return _Office.fromJson(json);
}

/// @nodoc
mixin _$Office {
  String get address => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get region => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfficeCopyWith<Office> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfficeCopyWith<$Res> {
  factory $OfficeCopyWith(Office value, $Res Function(Office) then) =
      _$OfficeCopyWithImpl<$Res, Office>;
  @useResult
  $Res call(
      {String address,
      String id,
      String image,
      double lat,
      double lng,
      String name,
      String phone,
      String region});
}

/// @nodoc
class _$OfficeCopyWithImpl<$Res, $Val extends Office>
    implements $OfficeCopyWith<$Res> {
  _$OfficeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? id = null,
    Object? image = null,
    Object? lat = null,
    Object? lng = null,
    Object? name = null,
    Object? phone = null,
    Object? region = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfficeImplCopyWith<$Res> implements $OfficeCopyWith<$Res> {
  factory _$$OfficeImplCopyWith(
          _$OfficeImpl value, $Res Function(_$OfficeImpl) then) =
      __$$OfficeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String id,
      String image,
      double lat,
      double lng,
      String name,
      String phone,
      String region});
}

/// @nodoc
class __$$OfficeImplCopyWithImpl<$Res>
    extends _$OfficeCopyWithImpl<$Res, _$OfficeImpl>
    implements _$$OfficeImplCopyWith<$Res> {
  __$$OfficeImplCopyWithImpl(
      _$OfficeImpl _value, $Res Function(_$OfficeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? id = null,
    Object? image = null,
    Object? lat = null,
    Object? lng = null,
    Object? name = null,
    Object? phone = null,
    Object? region = null,
  }) {
    return _then(_$OfficeImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfficeImpl implements _Office {
  const _$OfficeImpl(
      {required this.address,
      required this.id,
      required this.image,
      required this.lat,
      required this.lng,
      required this.name,
      required this.phone,
      required this.region});

  factory _$OfficeImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfficeImplFromJson(json);

  @override
  final String address;
  @override
  final String id;
  @override
  final String image;
  @override
  final double lat;
  @override
  final double lng;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String region;

  @override
  String toString() {
    return 'Office(address: $address, id: $id, image: $image, lat: $lat, lng: $lng, name: $name, phone: $phone, region: $region)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfficeImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.region, region) || other.region == region));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, id, image, lat, lng, name, phone, region);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfficeImplCopyWith<_$OfficeImpl> get copyWith =>
      __$$OfficeImplCopyWithImpl<_$OfficeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfficeImplToJson(
      this,
    );
  }
}

abstract class _Office implements Office {
  const factory _Office(
      {required final String address,
      required final String id,
      required final String image,
      required final double lat,
      required final double lng,
      required final String name,
      required final String phone,
      required final String region}) = _$OfficeImpl;

  factory _Office.fromJson(Map<String, dynamic> json) = _$OfficeImpl.fromJson;

  @override
  String get address;
  @override
  String get id;
  @override
  String get image;
  @override
  double get lat;
  @override
  double get lng;
  @override
  String get name;
  @override
  String get phone;
  @override
  String get region;
  @override
  @JsonKey(ignore: true)
  _$$OfficeImplCopyWith<_$OfficeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
mixin _$Region {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get zoom => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res, Region>;
  @useResult
  $Res call({double lat, double lng, String id, String name, int zoom});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res, $Val extends Region>
    implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? id = null,
    Object? name = null,
    Object? zoom = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegionImplCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$RegionImplCopyWith(
          _$RegionImpl value, $Res Function(_$RegionImpl) then) =
      __$$RegionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng, String id, String name, int zoom});
}

/// @nodoc
class __$$RegionImplCopyWithImpl<$Res>
    extends _$RegionCopyWithImpl<$Res, _$RegionImpl>
    implements _$$RegionImplCopyWith<$Res> {
  __$$RegionImplCopyWithImpl(
      _$RegionImpl _value, $Res Function(_$RegionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
    Object? id = null,
    Object? name = null,
    Object? zoom = null,
  }) {
    return _then(_$RegionImpl(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      zoom: null == zoom
          ? _value.zoom
          : zoom // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegionImpl implements _Region {
  const _$RegionImpl(
      {required this.lat,
      required this.lng,
      required this.id,
      required this.name,
      required this.zoom});

  factory _$RegionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegionImplFromJson(json);

  @override
  final double lat;
  @override
  final double lng;
  @override
  final String id;
  @override
  final String name;
  @override
  final int zoom;

  @override
  String toString() {
    return 'Region(lat: $lat, lng: $lng, id: $id, name: $name, zoom: $zoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegionImpl &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.zoom, zoom) || other.zoom == zoom));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng, id, name, zoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      __$$RegionImplCopyWithImpl<_$RegionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegionImplToJson(
      this,
    );
  }
}

abstract class _Region implements Region {
  const factory _Region(
      {required final double lat,
      required final double lng,
      required final String id,
      required final String name,
      required final int zoom}) = _$RegionImpl;

  factory _Region.fromJson(Map<String, dynamic> json) = _$RegionImpl.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  String get id;
  @override
  String get name;
  @override
  int get zoom;
  @override
  @JsonKey(ignore: true)
  _$$RegionImplCopyWith<_$RegionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
