// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_prof.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetUserProf _$GetUserProfFromJson(Map<String, dynamic> json) {
  return _GetUserProf.fromJson(json);
}

/// @nodoc
mixin _$GetUserProf {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<UserData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserProfCopyWith<GetUserProf> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserProfCopyWith<$Res> {
  factory $GetUserProfCopyWith(
          GetUserProf value, $Res Function(GetUserProf) then) =
      _$GetUserProfCopyWithImpl<$Res, GetUserProf>;
  @useResult
  $Res call({bool? success, String? message, List<UserData>? data});
}

/// @nodoc
class _$GetUserProfCopyWithImpl<$Res, $Val extends GetUserProf>
    implements $GetUserProfCopyWith<$Res> {
  _$GetUserProfCopyWithImpl(this._value, this._then);

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
              as List<UserData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetUserProfImplCopyWith<$Res>
    implements $GetUserProfCopyWith<$Res> {
  factory _$$GetUserProfImplCopyWith(
          _$GetUserProfImpl value, $Res Function(_$GetUserProfImpl) then) =
      __$$GetUserProfImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<UserData>? data});
}

/// @nodoc
class __$$GetUserProfImplCopyWithImpl<$Res>
    extends _$GetUserProfCopyWithImpl<$Res, _$GetUserProfImpl>
    implements _$$GetUserProfImplCopyWith<$Res> {
  __$$GetUserProfImplCopyWithImpl(
      _$GetUserProfImpl _value, $Res Function(_$GetUserProfImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetUserProfImpl(
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
              as List<UserData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetUserProfImpl implements _GetUserProf {
  const _$GetUserProfImpl(
      {required this.success,
      required this.message,
      required final List<UserData>? data})
      : _data = data;

  factory _$GetUserProfImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetUserProfImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<UserData>? _data;
  @override
  List<UserData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetUserProf(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserProfImpl &&
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
  _$$GetUserProfImplCopyWith<_$GetUserProfImpl> get copyWith =>
      __$$GetUserProfImplCopyWithImpl<_$GetUserProfImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetUserProfImplToJson(
      this,
    );
  }
}

abstract class _GetUserProf implements GetUserProf {
  const factory _GetUserProf(
      {required final bool? success,
      required final String? message,
      required final List<UserData>? data}) = _$GetUserProfImpl;

  factory _GetUserProf.fromJson(Map<String, dynamic> json) =
      _$GetUserProfImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<UserData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetUserProfImplCopyWith<_$GetUserProfImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String? get user_id => throw _privateConstructorUsedError;
  String? get user_name => throw _privateConstructorUsedError;
  String? get user_img => throw _privateConstructorUsedError;
  String? get user_desc => throw _privateConstructorUsedError;
  String? get user_contrycode => throw _privateConstructorUsedError;
  String? get user_phoneno => throw _privateConstructorUsedError;
  String? get user_email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String? user_id,
      String? user_name,
      String? user_img,
      String? user_desc,
      String? user_contrycode,
      String? user_phoneno,
      String? user_email});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = freezed,
    Object? user_name = freezed,
    Object? user_img = freezed,
    Object? user_desc = freezed,
    Object? user_contrycode = freezed,
    Object? user_phoneno = freezed,
    Object? user_email = freezed,
  }) {
    return _then(_value.copyWith(
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      user_name: freezed == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      user_img: freezed == user_img
          ? _value.user_img
          : user_img // ignore: cast_nullable_to_non_nullable
              as String?,
      user_desc: freezed == user_desc
          ? _value.user_desc
          : user_desc // ignore: cast_nullable_to_non_nullable
              as String?,
      user_contrycode: freezed == user_contrycode
          ? _value.user_contrycode
          : user_contrycode // ignore: cast_nullable_to_non_nullable
              as String?,
      user_phoneno: freezed == user_phoneno
          ? _value.user_phoneno
          : user_phoneno // ignore: cast_nullable_to_non_nullable
              as String?,
      user_email: freezed == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? user_id,
      String? user_name,
      String? user_img,
      String? user_desc,
      String? user_contrycode,
      String? user_phoneno,
      String? user_email});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_id = freezed,
    Object? user_name = freezed,
    Object? user_img = freezed,
    Object? user_desc = freezed,
    Object? user_contrycode = freezed,
    Object? user_phoneno = freezed,
    Object? user_email = freezed,
  }) {
    return _then(_$UserDataImpl(
      user_id: freezed == user_id
          ? _value.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      user_name: freezed == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      user_img: freezed == user_img
          ? _value.user_img
          : user_img // ignore: cast_nullable_to_non_nullable
              as String?,
      user_desc: freezed == user_desc
          ? _value.user_desc
          : user_desc // ignore: cast_nullable_to_non_nullable
              as String?,
      user_contrycode: freezed == user_contrycode
          ? _value.user_contrycode
          : user_contrycode // ignore: cast_nullable_to_non_nullable
              as String?,
      user_phoneno: freezed == user_phoneno
          ? _value.user_phoneno
          : user_phoneno // ignore: cast_nullable_to_non_nullable
              as String?,
      user_email: freezed == user_email
          ? _value.user_email
          : user_email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {required this.user_id,
      required this.user_name,
      required this.user_img,
      required this.user_desc,
      required this.user_contrycode,
      required this.user_phoneno,
      required this.user_email});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final String? user_id;
  @override
  final String? user_name;
  @override
  final String? user_img;
  @override
  final String? user_desc;
  @override
  final String? user_contrycode;
  @override
  final String? user_phoneno;
  @override
  final String? user_email;

  @override
  String toString() {
    return 'UserData(user_id: $user_id, user_name: $user_name, user_img: $user_img, user_desc: $user_desc, user_contrycode: $user_contrycode, user_phoneno: $user_phoneno, user_email: $user_email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.user_name, user_name) ||
                other.user_name == user_name) &&
            (identical(other.user_img, user_img) ||
                other.user_img == user_img) &&
            (identical(other.user_desc, user_desc) ||
                other.user_desc == user_desc) &&
            (identical(other.user_contrycode, user_contrycode) ||
                other.user_contrycode == user_contrycode) &&
            (identical(other.user_phoneno, user_phoneno) ||
                other.user_phoneno == user_phoneno) &&
            (identical(other.user_email, user_email) ||
                other.user_email == user_email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_id, user_name, user_img,
      user_desc, user_contrycode, user_phoneno, user_email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required final String? user_id,
      required final String? user_name,
      required final String? user_img,
      required final String? user_desc,
      required final String? user_contrycode,
      required final String? user_phoneno,
      required final String? user_email}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  String? get user_id;
  @override
  String? get user_name;
  @override
  String? get user_img;
  @override
  String? get user_desc;
  @override
  String? get user_contrycode;
  @override
  String? get user_phoneno;
  @override
  String? get user_email;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
