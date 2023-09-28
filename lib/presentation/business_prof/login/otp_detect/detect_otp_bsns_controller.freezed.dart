// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detect_otp_bsns_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BusinessDetectOtpState {
  int? get start => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessDetectOtpStateCopyWith<BusinessDetectOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessDetectOtpStateCopyWith<$Res> {
  factory $BusinessDetectOtpStateCopyWith(BusinessDetectOtpState value,
          $Res Function(BusinessDetectOtpState) then) =
      _$BusinessDetectOtpStateCopyWithImpl<$Res, BusinessDetectOtpState>;
  @useResult
  $Res call({int? start});
}

/// @nodoc
class _$BusinessDetectOtpStateCopyWithImpl<$Res,
        $Val extends BusinessDetectOtpState>
    implements $BusinessDetectOtpStateCopyWith<$Res> {
  _$BusinessDetectOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
  }) {
    return _then(_value.copyWith(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BusinessDetectOtpStateImplCopyWith<$Res>
    implements $BusinessDetectOtpStateCopyWith<$Res> {
  factory _$$BusinessDetectOtpStateImplCopyWith(
          _$BusinessDetectOtpStateImpl value,
          $Res Function(_$BusinessDetectOtpStateImpl) then) =
      __$$BusinessDetectOtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? start});
}

/// @nodoc
class __$$BusinessDetectOtpStateImplCopyWithImpl<$Res>
    extends _$BusinessDetectOtpStateCopyWithImpl<$Res,
        _$BusinessDetectOtpStateImpl>
    implements _$$BusinessDetectOtpStateImplCopyWith<$Res> {
  __$$BusinessDetectOtpStateImplCopyWithImpl(
      _$BusinessDetectOtpStateImpl _value,
      $Res Function(_$BusinessDetectOtpStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
  }) {
    return _then(_$BusinessDetectOtpStateImpl(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$BusinessDetectOtpStateImpl extends _BusinessDetectOtpState {
  const _$BusinessDetectOtpStateImpl({this.start}) : super._();

  @override
  final int? start;

  @override
  String toString() {
    return 'BusinessDetectOtpState(start: $start)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BusinessDetectOtpStateImpl &&
            (identical(other.start, start) || other.start == start));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BusinessDetectOtpStateImplCopyWith<_$BusinessDetectOtpStateImpl>
      get copyWith => __$$BusinessDetectOtpStateImplCopyWithImpl<
          _$BusinessDetectOtpStateImpl>(this, _$identity);
}

abstract class _BusinessDetectOtpState extends BusinessDetectOtpState {
  const factory _BusinessDetectOtpState({final int? start}) =
      _$BusinessDetectOtpStateImpl;
  const _BusinessDetectOtpState._() : super._();

  @override
  int? get start;
  @override
  @JsonKey(ignore: true)
  _$$BusinessDetectOtpStateImplCopyWith<_$BusinessDetectOtpStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
