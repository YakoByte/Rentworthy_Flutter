// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_verification_bsns_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BusinessAccountVerificationState {
  int? get start => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BusinessAccountVerificationStateCopyWith<BusinessAccountVerificationState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BusinessAccountVerificationStateCopyWith<$Res> {
  factory $BusinessAccountVerificationStateCopyWith(
          BusinessAccountVerificationState value,
          $Res Function(BusinessAccountVerificationState) then) =
      _$BusinessAccountVerificationStateCopyWithImpl<$Res,
          BusinessAccountVerificationState>;
  @useResult
  $Res call({int? start});
}

/// @nodoc
class _$BusinessAccountVerificationStateCopyWithImpl<$Res,
        $Val extends BusinessAccountVerificationState>
    implements $BusinessAccountVerificationStateCopyWith<$Res> {
  _$BusinessAccountVerificationStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_BusinessAccountVerificationStateCopyWith<$Res>
    implements $BusinessAccountVerificationStateCopyWith<$Res> {
  factory _$$_BusinessAccountVerificationStateCopyWith(
          _$_BusinessAccountVerificationState value,
          $Res Function(_$_BusinessAccountVerificationState) then) =
      __$$_BusinessAccountVerificationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? start});
}

/// @nodoc
class __$$_BusinessAccountVerificationStateCopyWithImpl<$Res>
    extends _$BusinessAccountVerificationStateCopyWithImpl<$Res,
        _$_BusinessAccountVerificationState>
    implements _$$_BusinessAccountVerificationStateCopyWith<$Res> {
  __$$_BusinessAccountVerificationStateCopyWithImpl(
      _$_BusinessAccountVerificationState _value,
      $Res Function(_$_BusinessAccountVerificationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
  }) {
    return _then(_$_BusinessAccountVerificationState(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_BusinessAccountVerificationState
    extends _BusinessAccountVerificationState {
  const _$_BusinessAccountVerificationState({this.start}) : super._();

  @override
  final int? start;

  @override
  String toString() {
    return 'BusinessAccountVerificationState(start: $start)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BusinessAccountVerificationState &&
            (identical(other.start, start) || other.start == start));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BusinessAccountVerificationStateCopyWith<
          _$_BusinessAccountVerificationState>
      get copyWith => __$$_BusinessAccountVerificationStateCopyWithImpl<
          _$_BusinessAccountVerificationState>(this, _$identity);
}

abstract class _BusinessAccountVerificationState
    extends BusinessAccountVerificationState {
  const factory _BusinessAccountVerificationState({final int? start}) =
      _$_BusinessAccountVerificationState;
  const _BusinessAccountVerificationState._() : super._();

  @override
  int? get start;
  @override
  @JsonKey(ignore: true)
  _$$_BusinessAccountVerificationStateCopyWith<
          _$_BusinessAccountVerificationState>
      get copyWith => throw _privateConstructorUsedError;
}
