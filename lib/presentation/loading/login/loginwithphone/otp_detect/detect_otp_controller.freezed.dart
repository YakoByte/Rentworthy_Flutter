// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detect_otp_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetectOtpState {
  int? get start => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetectOtpStateCopyWith<DetectOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetectOtpStateCopyWith<$Res> {
  factory $DetectOtpStateCopyWith(
          DetectOtpState value, $Res Function(DetectOtpState) then) =
      _$DetectOtpStateCopyWithImpl<$Res, DetectOtpState>;
  @useResult
  $Res call({int? start});
}

/// @nodoc
class _$DetectOtpStateCopyWithImpl<$Res, $Val extends DetectOtpState>
    implements $DetectOtpStateCopyWith<$Res> {
  _$DetectOtpStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_DetectOtpStateCopyWith<$Res>
    implements $DetectOtpStateCopyWith<$Res> {
  factory _$$_DetectOtpStateCopyWith(
          _$_DetectOtpState value, $Res Function(_$_DetectOtpState) then) =
      __$$_DetectOtpStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? start});
}

/// @nodoc
class __$$_DetectOtpStateCopyWithImpl<$Res>
    extends _$DetectOtpStateCopyWithImpl<$Res, _$_DetectOtpState>
    implements _$$_DetectOtpStateCopyWith<$Res> {
  __$$_DetectOtpStateCopyWithImpl(
      _$_DetectOtpState _value, $Res Function(_$_DetectOtpState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
  }) {
    return _then(_$_DetectOtpState(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_DetectOtpState extends _DetectOtpState {
  const _$_DetectOtpState({this.start}) : super._();

  @override
  final int? start;

  @override
  String toString() {
    return 'DetectOtpState(start: $start)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetectOtpState &&
            (identical(other.start, start) || other.start == start));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetectOtpStateCopyWith<_$_DetectOtpState> get copyWith =>
      __$$_DetectOtpStateCopyWithImpl<_$_DetectOtpState>(this, _$identity);
}

abstract class _DetectOtpState extends DetectOtpState {
  const factory _DetectOtpState({final int? start}) = _$_DetectOtpState;
  const _DetectOtpState._() : super._();

  @override
  int? get start;
  @override
  @JsonKey(ignore: true)
  _$$_DetectOtpStateCopyWith<_$_DetectOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}
