// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetChat _$GetChatFromJson(Map<String, dynamic> json) {
  return _GetChat.fromJson(json);
}

/// @nodoc
mixin _$GetChat {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ChatData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetChatCopyWith<GetChat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChatCopyWith<$Res> {
  factory $GetChatCopyWith(GetChat value, $Res Function(GetChat) then) =
      _$GetChatCopyWithImpl<$Res, GetChat>;
  @useResult
  $Res call({bool? success, String? message, List<ChatData>? data});
}

/// @nodoc
class _$GetChatCopyWithImpl<$Res, $Val extends GetChat>
    implements $GetChatCopyWith<$Res> {
  _$GetChatCopyWithImpl(this._value, this._then);

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
              as List<ChatData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetChatImplCopyWith<$Res> implements $GetChatCopyWith<$Res> {
  factory _$$GetChatImplCopyWith(
          _$GetChatImpl value, $Res Function(_$GetChatImpl) then) =
      __$$GetChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<ChatData>? data});
}

/// @nodoc
class __$$GetChatImplCopyWithImpl<$Res>
    extends _$GetChatCopyWithImpl<$Res, _$GetChatImpl>
    implements _$$GetChatImplCopyWith<$Res> {
  __$$GetChatImplCopyWithImpl(
      _$GetChatImpl _value, $Res Function(_$GetChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetChatImpl(
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
              as List<ChatData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetChatImpl implements _GetChat {
  const _$GetChatImpl(
      {required this.success,
      required this.message,
      required final List<ChatData>? data})
      : _data = data;

  factory _$GetChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetChatImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<ChatData>? _data;
  @override
  List<ChatData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetChat(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChatImpl &&
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
  _$$GetChatImplCopyWith<_$GetChatImpl> get copyWith =>
      __$$GetChatImplCopyWithImpl<_$GetChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetChatImplToJson(
      this,
    );
  }
}

abstract class _GetChat implements GetChat {
  const factory _GetChat(
      {required final bool? success,
      required final String? message,
      required final List<ChatData>? data}) = _$GetChatImpl;

  factory _GetChat.fromJson(Map<String, dynamic> json) = _$GetChatImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<ChatData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetChatImplCopyWith<_$GetChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ChatData _$ChatDataFromJson(Map<String, dynamic> json) {
  return _ChatData.fromJson(json);
}

/// @nodoc
mixin _$ChatData {
  String? get rec_user_id => throw _privateConstructorUsedError;
  String? get rec_user_name => throw _privateConstructorUsedError;
  String? get rec_user_img => throw _privateConstructorUsedError;
  String? get product_id => throw _privateConstructorUsedError;
  String? get product_name => throw _privateConstructorUsedError;
  String? get product_img => throw _privateConstructorUsedError;
  String? get product_chat_id => throw _privateConstructorUsedError;
  String? get last_msg => throw _privateConstructorUsedError;
  String? get last_msg_time => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatDataCopyWith<ChatData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatDataCopyWith<$Res> {
  factory $ChatDataCopyWith(ChatData value, $Res Function(ChatData) then) =
      _$ChatDataCopyWithImpl<$Res, ChatData>;
  @useResult
  $Res call(
      {String? rec_user_id,
      String? rec_user_name,
      String? rec_user_img,
      String? product_id,
      String? product_name,
      String? product_img,
      String? product_chat_id,
      String? last_msg,
      String? last_msg_time});
}

/// @nodoc
class _$ChatDataCopyWithImpl<$Res, $Val extends ChatData>
    implements $ChatDataCopyWith<$Res> {
  _$ChatDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rec_user_id = freezed,
    Object? rec_user_name = freezed,
    Object? rec_user_img = freezed,
    Object? product_id = freezed,
    Object? product_name = freezed,
    Object? product_img = freezed,
    Object? product_chat_id = freezed,
    Object? last_msg = freezed,
    Object? last_msg_time = freezed,
  }) {
    return _then(_value.copyWith(
      rec_user_id: freezed == rec_user_id
          ? _value.rec_user_id
          : rec_user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      rec_user_name: freezed == rec_user_name
          ? _value.rec_user_name
          : rec_user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      rec_user_img: freezed == rec_user_img
          ? _value.rec_user_img
          : rec_user_img // ignore: cast_nullable_to_non_nullable
              as String?,
      product_id: freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as String?,
      product_name: freezed == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String?,
      product_img: freezed == product_img
          ? _value.product_img
          : product_img // ignore: cast_nullable_to_non_nullable
              as String?,
      product_chat_id: freezed == product_chat_id
          ? _value.product_chat_id
          : product_chat_id // ignore: cast_nullable_to_non_nullable
              as String?,
      last_msg: freezed == last_msg
          ? _value.last_msg
          : last_msg // ignore: cast_nullable_to_non_nullable
              as String?,
      last_msg_time: freezed == last_msg_time
          ? _value.last_msg_time
          : last_msg_time // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatDataImplCopyWith<$Res>
    implements $ChatDataCopyWith<$Res> {
  factory _$$ChatDataImplCopyWith(
          _$ChatDataImpl value, $Res Function(_$ChatDataImpl) then) =
      __$$ChatDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? rec_user_id,
      String? rec_user_name,
      String? rec_user_img,
      String? product_id,
      String? product_name,
      String? product_img,
      String? product_chat_id,
      String? last_msg,
      String? last_msg_time});
}

/// @nodoc
class __$$ChatDataImplCopyWithImpl<$Res>
    extends _$ChatDataCopyWithImpl<$Res, _$ChatDataImpl>
    implements _$$ChatDataImplCopyWith<$Res> {
  __$$ChatDataImplCopyWithImpl(
      _$ChatDataImpl _value, $Res Function(_$ChatDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rec_user_id = freezed,
    Object? rec_user_name = freezed,
    Object? rec_user_img = freezed,
    Object? product_id = freezed,
    Object? product_name = freezed,
    Object? product_img = freezed,
    Object? product_chat_id = freezed,
    Object? last_msg = freezed,
    Object? last_msg_time = freezed,
  }) {
    return _then(_$ChatDataImpl(
      rec_user_id: freezed == rec_user_id
          ? _value.rec_user_id
          : rec_user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      rec_user_name: freezed == rec_user_name
          ? _value.rec_user_name
          : rec_user_name // ignore: cast_nullable_to_non_nullable
              as String?,
      rec_user_img: freezed == rec_user_img
          ? _value.rec_user_img
          : rec_user_img // ignore: cast_nullable_to_non_nullable
              as String?,
      product_id: freezed == product_id
          ? _value.product_id
          : product_id // ignore: cast_nullable_to_non_nullable
              as String?,
      product_name: freezed == product_name
          ? _value.product_name
          : product_name // ignore: cast_nullable_to_non_nullable
              as String?,
      product_img: freezed == product_img
          ? _value.product_img
          : product_img // ignore: cast_nullable_to_non_nullable
              as String?,
      product_chat_id: freezed == product_chat_id
          ? _value.product_chat_id
          : product_chat_id // ignore: cast_nullable_to_non_nullable
              as String?,
      last_msg: freezed == last_msg
          ? _value.last_msg
          : last_msg // ignore: cast_nullable_to_non_nullable
              as String?,
      last_msg_time: freezed == last_msg_time
          ? _value.last_msg_time
          : last_msg_time // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatDataImpl implements _ChatData {
  const _$ChatDataImpl(
      {required this.rec_user_id,
      required this.rec_user_name,
      required this.rec_user_img,
      required this.product_id,
      required this.product_name,
      required this.product_img,
      required this.product_chat_id,
      required this.last_msg,
      required this.last_msg_time});

  factory _$ChatDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatDataImplFromJson(json);

  @override
  final String? rec_user_id;
  @override
  final String? rec_user_name;
  @override
  final String? rec_user_img;
  @override
  final String? product_id;
  @override
  final String? product_name;
  @override
  final String? product_img;
  @override
  final String? product_chat_id;
  @override
  final String? last_msg;
  @override
  final String? last_msg_time;

  @override
  String toString() {
    return 'ChatData(rec_user_id: $rec_user_id, rec_user_name: $rec_user_name, rec_user_img: $rec_user_img, product_id: $product_id, product_name: $product_name, product_img: $product_img, product_chat_id: $product_chat_id, last_msg: $last_msg, last_msg_time: $last_msg_time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatDataImpl &&
            (identical(other.rec_user_id, rec_user_id) ||
                other.rec_user_id == rec_user_id) &&
            (identical(other.rec_user_name, rec_user_name) ||
                other.rec_user_name == rec_user_name) &&
            (identical(other.rec_user_img, rec_user_img) ||
                other.rec_user_img == rec_user_img) &&
            (identical(other.product_id, product_id) ||
                other.product_id == product_id) &&
            (identical(other.product_name, product_name) ||
                other.product_name == product_name) &&
            (identical(other.product_img, product_img) ||
                other.product_img == product_img) &&
            (identical(other.product_chat_id, product_chat_id) ||
                other.product_chat_id == product_chat_id) &&
            (identical(other.last_msg, last_msg) ||
                other.last_msg == last_msg) &&
            (identical(other.last_msg_time, last_msg_time) ||
                other.last_msg_time == last_msg_time));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      rec_user_id,
      rec_user_name,
      rec_user_img,
      product_id,
      product_name,
      product_img,
      product_chat_id,
      last_msg,
      last_msg_time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      __$$ChatDataImplCopyWithImpl<_$ChatDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatDataImplToJson(
      this,
    );
  }
}

abstract class _ChatData implements ChatData {
  const factory _ChatData(
      {required final String? rec_user_id,
      required final String? rec_user_name,
      required final String? rec_user_img,
      required final String? product_id,
      required final String? product_name,
      required final String? product_img,
      required final String? product_chat_id,
      required final String? last_msg,
      required final String? last_msg_time}) = _$ChatDataImpl;

  factory _ChatData.fromJson(Map<String, dynamic> json) =
      _$ChatDataImpl.fromJson;

  @override
  String? get rec_user_id;
  @override
  String? get rec_user_name;
  @override
  String? get rec_user_img;
  @override
  String? get product_id;
  @override
  String? get product_name;
  @override
  String? get product_img;
  @override
  String? get product_chat_id;
  @override
  String? get last_msg;
  @override
  String? get last_msg_time;
  @override
  @JsonKey(ignore: true)
  _$$ChatDataImplCopyWith<_$ChatDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
