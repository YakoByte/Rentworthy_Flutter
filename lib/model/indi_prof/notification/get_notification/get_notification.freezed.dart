// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetNotification _$GetNotificationFromJson(Map<String, dynamic> json) {
  return _GetNotification.fromJson(json);
}

/// @nodoc
mixin _$GetNotification {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool? get recommendations => throw _privateConstructorUsedError;
  bool? get receive_update_offer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetNotificationCopyWith<GetNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetNotificationCopyWith<$Res> {
  factory $GetNotificationCopyWith(
          GetNotification value, $Res Function(GetNotification) then) =
      _$GetNotificationCopyWithImpl<$Res, GetNotification>;
  @useResult
  $Res call(
      {bool? success,
      String? message,
      bool? recommendations,
      bool? receive_update_offer});
}

/// @nodoc
class _$GetNotificationCopyWithImpl<$Res, $Val extends GetNotification>
    implements $GetNotificationCopyWith<$Res> {
  _$GetNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? recommendations = freezed,
    Object? receive_update_offer = freezed,
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
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as bool?,
      receive_update_offer: freezed == receive_update_offer
          ? _value.receive_update_offer
          : receive_update_offer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetNotificationImplCopyWith<$Res>
    implements $GetNotificationCopyWith<$Res> {
  factory _$$GetNotificationImplCopyWith(_$GetNotificationImpl value,
          $Res Function(_$GetNotificationImpl) then) =
      __$$GetNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? success,
      String? message,
      bool? recommendations,
      bool? receive_update_offer});
}

/// @nodoc
class __$$GetNotificationImplCopyWithImpl<$Res>
    extends _$GetNotificationCopyWithImpl<$Res, _$GetNotificationImpl>
    implements _$$GetNotificationImplCopyWith<$Res> {
  __$$GetNotificationImplCopyWithImpl(
      _$GetNotificationImpl _value, $Res Function(_$GetNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? recommendations = freezed,
    Object? receive_update_offer = freezed,
  }) {
    return _then(_$GetNotificationImpl(
      success: freezed == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      recommendations: freezed == recommendations
          ? _value.recommendations
          : recommendations // ignore: cast_nullable_to_non_nullable
              as bool?,
      receive_update_offer: freezed == receive_update_offer
          ? _value.receive_update_offer
          : receive_update_offer // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetNotificationImpl implements _GetNotification {
  const _$GetNotificationImpl(
      {required this.success,
      required this.message,
      required this.recommendations,
      required this.receive_update_offer});

  factory _$GetNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetNotificationImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  @override
  final bool? recommendations;
  @override
  final bool? receive_update_offer;

  @override
  String toString() {
    return 'GetNotification(success: $success, message: $message, recommendations: $recommendations, receive_update_offer: $receive_update_offer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetNotificationImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.recommendations, recommendations) ||
                other.recommendations == recommendations) &&
            (identical(other.receive_update_offer, receive_update_offer) ||
                other.receive_update_offer == receive_update_offer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, success, message, recommendations, receive_update_offer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetNotificationImplCopyWith<_$GetNotificationImpl> get copyWith =>
      __$$GetNotificationImplCopyWithImpl<_$GetNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetNotificationImplToJson(
      this,
    );
  }
}

abstract class _GetNotification implements GetNotification {
  const factory _GetNotification(
      {required final bool? success,
      required final String? message,
      required final bool? recommendations,
      required final bool? receive_update_offer}) = _$GetNotificationImpl;

  factory _GetNotification.fromJson(Map<String, dynamic> json) =
      _$GetNotificationImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  bool? get recommendations;
  @override
  bool? get receive_update_offer;
  @override
  @JsonKey(ignore: true)
  _$$GetNotificationImplCopyWith<_$GetNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
