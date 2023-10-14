// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_del_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetBookingDelStatus _$GetBookingDelStatusFromJson(Map<String, dynamic> json) {
  return _GetBookingDelStatus.fromJson(json);
}

/// @nodoc
mixin _$GetBookingDelStatus {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<BookingDelStatusData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetBookingDelStatusCopyWith<GetBookingDelStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBookingDelStatusCopyWith<$Res> {
  factory $GetBookingDelStatusCopyWith(
          GetBookingDelStatus value, $Res Function(GetBookingDelStatus) then) =
      _$GetBookingDelStatusCopyWithImpl<$Res, GetBookingDelStatus>;
  @useResult
  $Res call({bool? success, String? message, List<BookingDelStatusData>? data});
}

/// @nodoc
class _$GetBookingDelStatusCopyWithImpl<$Res, $Val extends GetBookingDelStatus>
    implements $GetBookingDelStatusCopyWith<$Res> {
  _$GetBookingDelStatusCopyWithImpl(this._value, this._then);

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
              as List<BookingDelStatusData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetBookingDelStatusImplCopyWith<$Res>
    implements $GetBookingDelStatusCopyWith<$Res> {
  factory _$$GetBookingDelStatusImplCopyWith(_$GetBookingDelStatusImpl value,
          $Res Function(_$GetBookingDelStatusImpl) then) =
      __$$GetBookingDelStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<BookingDelStatusData>? data});
}

/// @nodoc
class __$$GetBookingDelStatusImplCopyWithImpl<$Res>
    extends _$GetBookingDelStatusCopyWithImpl<$Res, _$GetBookingDelStatusImpl>
    implements _$$GetBookingDelStatusImplCopyWith<$Res> {
  __$$GetBookingDelStatusImplCopyWithImpl(_$GetBookingDelStatusImpl _value,
      $Res Function(_$GetBookingDelStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetBookingDelStatusImpl(
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
              as List<BookingDelStatusData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetBookingDelStatusImpl implements _GetBookingDelStatus {
  const _$GetBookingDelStatusImpl(
      {required this.success,
      required this.message,
      required final List<BookingDelStatusData>? data})
      : _data = data;

  factory _$GetBookingDelStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetBookingDelStatusImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<BookingDelStatusData>? _data;
  @override
  List<BookingDelStatusData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetBookingDelStatus(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBookingDelStatusImpl &&
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
  _$$GetBookingDelStatusImplCopyWith<_$GetBookingDelStatusImpl> get copyWith =>
      __$$GetBookingDelStatusImplCopyWithImpl<_$GetBookingDelStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetBookingDelStatusImplToJson(
      this,
    );
  }
}

abstract class _GetBookingDelStatus implements GetBookingDelStatus {
  const factory _GetBookingDelStatus(
          {required final bool? success,
          required final String? message,
          required final List<BookingDelStatusData>? data}) =
      _$GetBookingDelStatusImpl;

  factory _GetBookingDelStatus.fromJson(Map<String, dynamic> json) =
      _$GetBookingDelStatusImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<BookingDelStatusData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetBookingDelStatusImplCopyWith<_$GetBookingDelStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingDelStatusData _$BookingDelStatusDataFromJson(Map<String, dynamic> json) {
  return _BookingDelStatusData.fromJson(json);
}

/// @nodoc
mixin _$BookingDelStatusData {
  String? get status => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;
  bool? get active_status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingDelStatusDataCopyWith<BookingDelStatusData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDelStatusDataCopyWith<$Res> {
  factory $BookingDelStatusDataCopyWith(BookingDelStatusData value,
          $Res Function(BookingDelStatusData) then) =
      _$BookingDelStatusDataCopyWithImpl<$Res, BookingDelStatusData>;
  @useResult
  $Res call({String? status, String? desc, String? date, bool? active_status});
}

/// @nodoc
class _$BookingDelStatusDataCopyWithImpl<$Res,
        $Val extends BookingDelStatusData>
    implements $BookingDelStatusDataCopyWith<$Res> {
  _$BookingDelStatusDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? desc = freezed,
    Object? date = freezed,
    Object? active_status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      active_status: freezed == active_status
          ? _value.active_status
          : active_status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDelStatusDataImplCopyWith<$Res>
    implements $BookingDelStatusDataCopyWith<$Res> {
  factory _$$BookingDelStatusDataImplCopyWith(_$BookingDelStatusDataImpl value,
          $Res Function(_$BookingDelStatusDataImpl) then) =
      __$$BookingDelStatusDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status, String? desc, String? date, bool? active_status});
}

/// @nodoc
class __$$BookingDelStatusDataImplCopyWithImpl<$Res>
    extends _$BookingDelStatusDataCopyWithImpl<$Res, _$BookingDelStatusDataImpl>
    implements _$$BookingDelStatusDataImplCopyWith<$Res> {
  __$$BookingDelStatusDataImplCopyWithImpl(_$BookingDelStatusDataImpl _value,
      $Res Function(_$BookingDelStatusDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? desc = freezed,
    Object? date = freezed,
    Object? active_status = freezed,
  }) {
    return _then(_$BookingDelStatusDataImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      active_status: freezed == active_status
          ? _value.active_status
          : active_status // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingDelStatusDataImpl implements _BookingDelStatusData {
  const _$BookingDelStatusDataImpl(
      {required this.status,
      required this.desc,
      required this.date,
      required this.active_status});

  factory _$BookingDelStatusDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingDelStatusDataImplFromJson(json);

  @override
  final String? status;
  @override
  final String? desc;
  @override
  final String? date;
  @override
  final bool? active_status;

  @override
  String toString() {
    return 'BookingDelStatusData(status: $status, desc: $desc, date: $date, active_status: $active_status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDelStatusDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.active_status, active_status) ||
                other.active_status == active_status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, desc, date, active_status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDelStatusDataImplCopyWith<_$BookingDelStatusDataImpl>
      get copyWith =>
          __$$BookingDelStatusDataImplCopyWithImpl<_$BookingDelStatusDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingDelStatusDataImplToJson(
      this,
    );
  }
}

abstract class _BookingDelStatusData implements BookingDelStatusData {
  const factory _BookingDelStatusData(
      {required final String? status,
      required final String? desc,
      required final String? date,
      required final bool? active_status}) = _$BookingDelStatusDataImpl;

  factory _BookingDelStatusData.fromJson(Map<String, dynamic> json) =
      _$BookingDelStatusDataImpl.fromJson;

  @override
  String? get status;
  @override
  String? get desc;
  @override
  String? get date;
  @override
  bool? get active_status;
  @override
  @JsonKey(ignore: true)
  _$$BookingDelStatusDataImplCopyWith<_$BookingDelStatusDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
