// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_admin_panel_analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnalyticsResponse _$AnalyticsResponseFromJson(Map<String, dynamic> json) {
  return _AnalyticsResponse.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsResponse {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<AnalyticsData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsResponseCopyWith<AnalyticsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsResponseCopyWith<$Res> {
  factory $AnalyticsResponseCopyWith(
          AnalyticsResponse value, $Res Function(AnalyticsResponse) then) =
      _$AnalyticsResponseCopyWithImpl<$Res, AnalyticsResponse>;
  @useResult
  $Res call({bool? success, String? message, List<AnalyticsData>? data});
}

/// @nodoc
class _$AnalyticsResponseCopyWithImpl<$Res, $Val extends AnalyticsResponse>
    implements $AnalyticsResponseCopyWith<$Res> {
  _$AnalyticsResponseCopyWithImpl(this._value, this._then);

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
              as List<AnalyticsData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsResponseImplCopyWith<$Res>
    implements $AnalyticsResponseCopyWith<$Res> {
  factory _$$AnalyticsResponseImplCopyWith(_$AnalyticsResponseImpl value,
          $Res Function(_$AnalyticsResponseImpl) then) =
      __$$AnalyticsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<AnalyticsData>? data});
}

/// @nodoc
class __$$AnalyticsResponseImplCopyWithImpl<$Res>
    extends _$AnalyticsResponseCopyWithImpl<$Res, _$AnalyticsResponseImpl>
    implements _$$AnalyticsResponseImplCopyWith<$Res> {
  __$$AnalyticsResponseImplCopyWithImpl(_$AnalyticsResponseImpl _value,
      $Res Function(_$AnalyticsResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$AnalyticsResponseImpl(
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
              as List<AnalyticsData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsResponseImpl implements _AnalyticsResponse {
  const _$AnalyticsResponseImpl(
      {required this.success,
      required this.message,
      required final List<AnalyticsData>? data})
      : _data = data;

  factory _$AnalyticsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsResponseImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<AnalyticsData>? _data;
  @override
  List<AnalyticsData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AnalyticsResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsResponseImpl &&
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
  _$$AnalyticsResponseImplCopyWith<_$AnalyticsResponseImpl> get copyWith =>
      __$$AnalyticsResponseImplCopyWithImpl<_$AnalyticsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsResponseImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsResponse implements AnalyticsResponse {
  const factory _AnalyticsResponse(
      {required final bool? success,
      required final String? message,
      required final List<AnalyticsData>? data}) = _$AnalyticsResponseImpl;

  factory _AnalyticsResponse.fromJson(Map<String, dynamic> json) =
      _$AnalyticsResponseImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<AnalyticsData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsResponseImplCopyWith<_$AnalyticsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsData _$AnalyticsDataFromJson(Map<String, dynamic> json) {
  return _AnalyticsData.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsData {
  String? get title => throw _privateConstructorUsedError;
  String? get total_value => throw _privateConstructorUsedError;
  String? get percent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsDataCopyWith<AnalyticsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsDataCopyWith<$Res> {
  factory $AnalyticsDataCopyWith(
          AnalyticsData value, $Res Function(AnalyticsData) then) =
      _$AnalyticsDataCopyWithImpl<$Res, AnalyticsData>;
  @useResult
  $Res call({String? title, String? total_value, String? percent});
}

/// @nodoc
class _$AnalyticsDataCopyWithImpl<$Res, $Val extends AnalyticsData>
    implements $AnalyticsDataCopyWith<$Res> {
  _$AnalyticsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? total_value = freezed,
    Object? percent = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      total_value: freezed == total_value
          ? _value.total_value
          : total_value // ignore: cast_nullable_to_non_nullable
              as String?,
      percent: freezed == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsDataImplCopyWith<$Res>
    implements $AnalyticsDataCopyWith<$Res> {
  factory _$$AnalyticsDataImplCopyWith(
          _$AnalyticsDataImpl value, $Res Function(_$AnalyticsDataImpl) then) =
      __$$AnalyticsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? total_value, String? percent});
}

/// @nodoc
class __$$AnalyticsDataImplCopyWithImpl<$Res>
    extends _$AnalyticsDataCopyWithImpl<$Res, _$AnalyticsDataImpl>
    implements _$$AnalyticsDataImplCopyWith<$Res> {
  __$$AnalyticsDataImplCopyWithImpl(
      _$AnalyticsDataImpl _value, $Res Function(_$AnalyticsDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? total_value = freezed,
    Object? percent = freezed,
  }) {
    return _then(_$AnalyticsDataImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      total_value: freezed == total_value
          ? _value.total_value
          : total_value // ignore: cast_nullable_to_non_nullable
              as String?,
      percent: freezed == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsDataImpl implements _AnalyticsData {
  const _$AnalyticsDataImpl(
      {required this.title, required this.total_value, required this.percent});

  factory _$AnalyticsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsDataImplFromJson(json);

  @override
  final String? title;
  @override
  final String? total_value;
  @override
  final String? percent;

  @override
  String toString() {
    return 'AnalyticsData(title: $title, total_value: $total_value, percent: $percent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsDataImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.total_value, total_value) ||
                other.total_value == total_value) &&
            (identical(other.percent, percent) || other.percent == percent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, total_value, percent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      __$$AnalyticsDataImplCopyWithImpl<_$AnalyticsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsDataImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsData implements AnalyticsData {
  const factory _AnalyticsData(
      {required final String? title,
      required final String? total_value,
      required final String? percent}) = _$AnalyticsDataImpl;

  factory _AnalyticsData.fromJson(Map<String, dynamic> json) =
      _$AnalyticsDataImpl.fromJson;

  @override
  String? get title;
  @override
  String? get total_value;
  @override
  String? get percent;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsDataImplCopyWith<_$AnalyticsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
