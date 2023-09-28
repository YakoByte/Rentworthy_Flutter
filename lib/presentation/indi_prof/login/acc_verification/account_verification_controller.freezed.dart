// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_verification_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountVerificationState {
  int? get start => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountVerificationStateCopyWith<AccountVerificationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountVerificationStateCopyWith<$Res> {
  factory $AccountVerificationStateCopyWith(AccountVerificationState value,
          $Res Function(AccountVerificationState) then) =
      _$AccountVerificationStateCopyWithImpl<$Res, AccountVerificationState>;
  @useResult
  $Res call({int? start});
}

/// @nodoc
class _$AccountVerificationStateCopyWithImpl<$Res,
        $Val extends AccountVerificationState>
    implements $AccountVerificationStateCopyWith<$Res> {
  _$AccountVerificationStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AccountVerificationStateImplCopyWith<$Res>
    implements $AccountVerificationStateCopyWith<$Res> {
  factory _$$AccountVerificationStateImplCopyWith(
          _$AccountVerificationStateImpl value,
          $Res Function(_$AccountVerificationStateImpl) then) =
      __$$AccountVerificationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? start});
}

/// @nodoc
class __$$AccountVerificationStateImplCopyWithImpl<$Res>
    extends _$AccountVerificationStateCopyWithImpl<$Res,
        _$AccountVerificationStateImpl>
    implements _$$AccountVerificationStateImplCopyWith<$Res> {
  __$$AccountVerificationStateImplCopyWithImpl(
      _$AccountVerificationStateImpl _value,
      $Res Function(_$AccountVerificationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
  }) {
    return _then(_$AccountVerificationStateImpl(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$AccountVerificationStateImpl extends _AccountVerificationState {
  const _$AccountVerificationStateImpl({this.start}) : super._();

  @override
  final int? start;

  @override
  String toString() {
    return 'AccountVerificationState(start: $start)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountVerificationStateImpl &&
            (identical(other.start, start) || other.start == start));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountVerificationStateImplCopyWith<_$AccountVerificationStateImpl>
      get copyWith => __$$AccountVerificationStateImplCopyWithImpl<
          _$AccountVerificationStateImpl>(this, _$identity);
}

abstract class _AccountVerificationState extends AccountVerificationState {
  const factory _AccountVerificationState({final int? start}) =
      _$AccountVerificationStateImpl;
  const _AccountVerificationState._() : super._();

  @override
  int? get start;
  @override
  @JsonKey(ignore: true)
  _$$AccountVerificationStateImplCopyWith<_$AccountVerificationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
