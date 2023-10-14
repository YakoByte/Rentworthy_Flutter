// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetAddress _$GetAddressFromJson(Map<String, dynamic> json) {
  return _GetAddress.fromJson(json);
}

/// @nodoc
mixin _$GetAddress {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<AddressData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetAddressCopyWith<GetAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAddressCopyWith<$Res> {
  factory $GetAddressCopyWith(
          GetAddress value, $Res Function(GetAddress) then) =
      _$GetAddressCopyWithImpl<$Res, GetAddress>;
  @useResult
  $Res call({bool? success, String? message, List<AddressData>? data});
}

/// @nodoc
class _$GetAddressCopyWithImpl<$Res, $Val extends GetAddress>
    implements $GetAddressCopyWith<$Res> {
  _$GetAddressCopyWithImpl(this._value, this._then);

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
              as List<AddressData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAddressImplCopyWith<$Res>
    implements $GetAddressCopyWith<$Res> {
  factory _$$GetAddressImplCopyWith(
          _$GetAddressImpl value, $Res Function(_$GetAddressImpl) then) =
      __$$GetAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<AddressData>? data});
}

/// @nodoc
class __$$GetAddressImplCopyWithImpl<$Res>
    extends _$GetAddressCopyWithImpl<$Res, _$GetAddressImpl>
    implements _$$GetAddressImplCopyWith<$Res> {
  __$$GetAddressImplCopyWithImpl(
      _$GetAddressImpl _value, $Res Function(_$GetAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetAddressImpl(
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
              as List<AddressData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetAddressImpl implements _GetAddress {
  const _$GetAddressImpl(
      {required this.success,
      required this.message,
      required final List<AddressData>? data})
      : _data = data;

  factory _$GetAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetAddressImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<AddressData>? _data;
  @override
  List<AddressData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetAddress(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAddressImpl &&
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
  _$$GetAddressImplCopyWith<_$GetAddressImpl> get copyWith =>
      __$$GetAddressImplCopyWithImpl<_$GetAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetAddressImplToJson(
      this,
    );
  }
}

abstract class _GetAddress implements GetAddress {
  const factory _GetAddress(
      {required final bool? success,
      required final String? message,
      required final List<AddressData>? data}) = _$GetAddressImpl;

  factory _GetAddress.fromJson(Map<String, dynamic> json) =
      _$GetAddressImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<AddressData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetAddressImplCopyWith<_$GetAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressData _$AddressDataFromJson(Map<String, dynamic> json) {
  return _AddressData.fromJson(json);
}

/// @nodoc
mixin _$AddressData {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address_type => throw _privateConstructorUsedError;
  String? get address_line_1 => throw _privateConstructorUsedError;
  String? get address_line_2 => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get phone_no => throw _privateConstructorUsedError;
  String? get zip_code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressDataCopyWith<AddressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDataCopyWith<$Res> {
  factory $AddressDataCopyWith(
          AddressData value, $Res Function(AddressData) then) =
      _$AddressDataCopyWithImpl<$Res, AddressData>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address_type,
      String? address_line_1,
      String? address_line_2,
      String? city,
      String? state,
      String? phone_no,
      String? zip_code});
}

/// @nodoc
class _$AddressDataCopyWithImpl<$Res, $Val extends AddressData>
    implements $AddressDataCopyWith<$Res> {
  _$AddressDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address_type = freezed,
    Object? address_line_1 = freezed,
    Object? address_line_2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? phone_no = freezed,
    Object? zip_code = freezed,
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
      address_type: freezed == address_type
          ? _value.address_type
          : address_type // ignore: cast_nullable_to_non_nullable
              as String?,
      address_line_1: freezed == address_line_1
          ? _value.address_line_1
          : address_line_1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address_line_2: freezed == address_line_2
          ? _value.address_line_2
          : address_line_2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_no: freezed == phone_no
          ? _value.phone_no
          : phone_no // ignore: cast_nullable_to_non_nullable
              as String?,
      zip_code: freezed == zip_code
          ? _value.zip_code
          : zip_code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressDataImplCopyWith<$Res>
    implements $AddressDataCopyWith<$Res> {
  factory _$$AddressDataImplCopyWith(
          _$AddressDataImpl value, $Res Function(_$AddressDataImpl) then) =
      __$$AddressDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? address_type,
      String? address_line_1,
      String? address_line_2,
      String? city,
      String? state,
      String? phone_no,
      String? zip_code});
}

/// @nodoc
class __$$AddressDataImplCopyWithImpl<$Res>
    extends _$AddressDataCopyWithImpl<$Res, _$AddressDataImpl>
    implements _$$AddressDataImplCopyWith<$Res> {
  __$$AddressDataImplCopyWithImpl(
      _$AddressDataImpl _value, $Res Function(_$AddressDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address_type = freezed,
    Object? address_line_1 = freezed,
    Object? address_line_2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? phone_no = freezed,
    Object? zip_code = freezed,
  }) {
    return _then(_$AddressDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address_type: freezed == address_type
          ? _value.address_type
          : address_type // ignore: cast_nullable_to_non_nullable
              as String?,
      address_line_1: freezed == address_line_1
          ? _value.address_line_1
          : address_line_1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address_line_2: freezed == address_line_2
          ? _value.address_line_2
          : address_line_2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      phone_no: freezed == phone_no
          ? _value.phone_no
          : phone_no // ignore: cast_nullable_to_non_nullable
              as String?,
      zip_code: freezed == zip_code
          ? _value.zip_code
          : zip_code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressDataImpl implements _AddressData {
  const _$AddressDataImpl(
      {required this.id,
      required this.name,
      required this.address_type,
      required this.address_line_1,
      required this.address_line_2,
      required this.city,
      required this.state,
      required this.phone_no,
      required this.zip_code});

  factory _$AddressDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressDataImplFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? address_type;
  @override
  final String? address_line_1;
  @override
  final String? address_line_2;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? phone_no;
  @override
  final String? zip_code;

  @override
  String toString() {
    return 'AddressData(id: $id, name: $name, address_type: $address_type, address_line_1: $address_line_1, address_line_2: $address_line_2, city: $city, state: $state, phone_no: $phone_no, zip_code: $zip_code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address_type, address_type) ||
                other.address_type == address_type) &&
            (identical(other.address_line_1, address_line_1) ||
                other.address_line_1 == address_line_1) &&
            (identical(other.address_line_2, address_line_2) ||
                other.address_line_2 == address_line_2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.phone_no, phone_no) ||
                other.phone_no == phone_no) &&
            (identical(other.zip_code, zip_code) ||
                other.zip_code == zip_code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address_type,
      address_line_1, address_line_2, city, state, phone_no, zip_code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressDataImplCopyWith<_$AddressDataImpl> get copyWith =>
      __$$AddressDataImplCopyWithImpl<_$AddressDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressDataImplToJson(
      this,
    );
  }
}

abstract class _AddressData implements AddressData {
  const factory _AddressData(
      {required final String? id,
      required final String? name,
      required final String? address_type,
      required final String? address_line_1,
      required final String? address_line_2,
      required final String? city,
      required final String? state,
      required final String? phone_no,
      required final String? zip_code}) = _$AddressDataImpl;

  factory _AddressData.fromJson(Map<String, dynamic> json) =
      _$AddressDataImpl.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get address_type;
  @override
  String? get address_line_1;
  @override
  String? get address_line_2;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get phone_no;
  @override
  String? get zip_code;
  @override
  @JsonKey(ignore: true)
  _$$AddressDataImplCopyWith<_$AddressDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
