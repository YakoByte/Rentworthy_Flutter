// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetSummary _$GetSummaryFromJson(Map<String, dynamic> json) {
  return _GetSummary.fromJson(json);
}

/// @nodoc
mixin _$GetSummary {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get active_rental => throw _privateConstructorUsedError;
  String? get requests => throw _privateConstructorUsedError;
  String? get rented => throw _privateConstructorUsedError;
  String? get requested => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetSummaryCopyWith<GetSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSummaryCopyWith<$Res> {
  factory $GetSummaryCopyWith(
          GetSummary value, $Res Function(GetSummary) then) =
      _$GetSummaryCopyWithImpl<$Res, GetSummary>;
  @useResult
  $Res call(
      {bool? success,
      String? message,
      String? active_rental,
      String? requests,
      String? rented,
      String? requested});
}

/// @nodoc
class _$GetSummaryCopyWithImpl<$Res, $Val extends GetSummary>
    implements $GetSummaryCopyWith<$Res> {
  _$GetSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? active_rental = freezed,
    Object? requests = freezed,
    Object? rented = freezed,
    Object? requested = freezed,
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
      active_rental: freezed == active_rental
          ? _value.active_rental
          : active_rental // ignore: cast_nullable_to_non_nullable
              as String?,
      requests: freezed == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as String?,
      rented: freezed == rented
          ? _value.rented
          : rented // ignore: cast_nullable_to_non_nullable
              as String?,
      requested: freezed == requested
          ? _value.requested
          : requested // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSummaryImplCopyWith<$Res>
    implements $GetSummaryCopyWith<$Res> {
  factory _$$GetSummaryImplCopyWith(
          _$GetSummaryImpl value, $Res Function(_$GetSummaryImpl) then) =
      __$$GetSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      String? message,
      String? active_rental,
      String? requests,
      String? rented,
      String? requested});
}

/// @nodoc
class __$$GetSummaryImplCopyWithImpl<$Res>
    extends _$GetSummaryCopyWithImpl<$Res, _$GetSummaryImpl>
    implements _$$GetSummaryImplCopyWith<$Res> {
  __$$GetSummaryImplCopyWithImpl(
      _$GetSummaryImpl _value, $Res Function(_$GetSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? active_rental = freezed,
    Object? requests = freezed,
    Object? rented = freezed,
    Object? requested = freezed,
  }) {
    return _then(_$GetSummaryImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      active_rental: freezed == active_rental
          ? _value.active_rental
          : active_rental // ignore: cast_nullable_to_non_nullable
              as String?,
      requests: freezed == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as String?,
      rented: freezed == rented
          ? _value.rented
          : rented // ignore: cast_nullable_to_non_nullable
              as String?,
      requested: freezed == requested
          ? _value.requested
          : requested // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetSummaryImpl implements _GetSummary {
  const _$GetSummaryImpl(
      {required this.success,
      required this.message,
      required this.active_rental,
      required this.requests,
      required this.rented,
      required this.requested});

  factory _$GetSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetSummaryImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final String? active_rental;
  @override
  final String? requests;
  @override
  final String? rented;
  @override
  final String? requested;

  @override
  String toString() {
    return 'GetSummary(success: $success, message: $message, active_rental: $active_rental, requests: $requests, rented: $rented, requested: $requested)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSummaryImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.active_rental, active_rental) ||
                other.active_rental == active_rental) &&
            (identical(other.requests, requests) ||
                other.requests == requests) &&
            (identical(other.rented, rented) || other.rented == rented) &&
            (identical(other.requested, requested) ||
                other.requested == requested));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, active_rental,
      requests, rented, requested);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSummaryImplCopyWith<_$GetSummaryImpl> get copyWith =>
      __$$GetSummaryImplCopyWithImpl<_$GetSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSummaryImplToJson(
      this,
    );
  }
}

abstract class _GetSummary implements GetSummary {
  const factory _GetSummary(
      {required final bool? success,
      required final String? message,
      required final String? active_rental,
      required final String? requests,
      required final String? rented,
      required final String? requested}) = _$GetSummaryImpl;

  factory _GetSummary.fromJson(Map<String, dynamic> json) =
      _$GetSummaryImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  String? get active_rental;
  @override
  String? get requests;
  @override
  String? get rented;
  @override
  String? get requested;
  @override
  @JsonKey(ignore: true)
  _$$GetSummaryImplCopyWith<_$GetSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
