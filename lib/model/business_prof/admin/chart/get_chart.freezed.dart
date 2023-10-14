// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetChart _$GetChartFromJson(Map<String, dynamic> json) {
  return _GetChart.fromJson(json);
}

/// @nodoc
mixin _$GetChart {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<GetChartData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetChartCopyWith<GetChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChartCopyWith<$Res> {
  factory $GetChartCopyWith(GetChart value, $Res Function(GetChart) then) =
      _$GetChartCopyWithImpl<$Res, GetChart>;
  @useResult
  $Res call({bool? success, String? message, List<GetChartData>? data});
}

/// @nodoc
class _$GetChartCopyWithImpl<$Res, $Val extends GetChart>
    implements $GetChartCopyWith<$Res> {
  _$GetChartCopyWithImpl(this._value, this._then);

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
              as List<GetChartData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetChartImplCopyWith<$Res>
    implements $GetChartCopyWith<$Res> {
  factory _$$GetChartImplCopyWith(
          _$GetChartImpl value, $Res Function(_$GetChartImpl) then) =
      __$$GetChartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<GetChartData>? data});
}

/// @nodoc
class __$$GetChartImplCopyWithImpl<$Res>
    extends _$GetChartCopyWithImpl<$Res, _$GetChartImpl>
    implements _$$GetChartImplCopyWith<$Res> {
  __$$GetChartImplCopyWithImpl(
      _$GetChartImpl _value, $Res Function(_$GetChartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetChartImpl(
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
              as List<GetChartData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetChartImpl implements _GetChart {
  const _$GetChartImpl(
      {required this.success,
      required this.message,
      required final List<GetChartData>? data})
      : _data = data;

  factory _$GetChartImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetChartImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<GetChartData>? _data;
  @override
  List<GetChartData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetChart(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChartImpl &&
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
  _$$GetChartImplCopyWith<_$GetChartImpl> get copyWith =>
      __$$GetChartImplCopyWithImpl<_$GetChartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetChartImplToJson(
      this,
    );
  }
}

abstract class _GetChart implements GetChart {
  const factory _GetChart(
      {required final bool? success,
      required final String? message,
      required final List<GetChartData>? data}) = _$GetChartImpl;

  factory _GetChart.fromJson(Map<String, dynamic> json) =
      _$GetChartImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<GetChartData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetChartImplCopyWith<_$GetChartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetChartData _$GetChartDataFromJson(Map<String, dynamic> json) {
  return _GetChartData.fromJson(json);
}

/// @nodoc
mixin _$GetChartData {
  String? get xVal => throw _privateConstructorUsedError;
  String? get yVal => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetChartDataCopyWith<GetChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetChartDataCopyWith<$Res> {
  factory $GetChartDataCopyWith(
          GetChartData value, $Res Function(GetChartData) then) =
      _$GetChartDataCopyWithImpl<$Res, GetChartData>;
  @useResult
  $Res call({String? xVal, String? yVal, String? type});
}

/// @nodoc
class _$GetChartDataCopyWithImpl<$Res, $Val extends GetChartData>
    implements $GetChartDataCopyWith<$Res> {
  _$GetChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xVal = freezed,
    Object? yVal = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      xVal: freezed == xVal
          ? _value.xVal
          : xVal // ignore: cast_nullable_to_non_nullable
              as String?,
      yVal: freezed == yVal
          ? _value.yVal
          : yVal // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetChartDataImplCopyWith<$Res>
    implements $GetChartDataCopyWith<$Res> {
  factory _$$GetChartDataImplCopyWith(
          _$GetChartDataImpl value, $Res Function(_$GetChartDataImpl) then) =
      __$$GetChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? xVal, String? yVal, String? type});
}

/// @nodoc
class __$$GetChartDataImplCopyWithImpl<$Res>
    extends _$GetChartDataCopyWithImpl<$Res, _$GetChartDataImpl>
    implements _$$GetChartDataImplCopyWith<$Res> {
  __$$GetChartDataImplCopyWithImpl(
      _$GetChartDataImpl _value, $Res Function(_$GetChartDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? xVal = freezed,
    Object? yVal = freezed,
    Object? type = freezed,
  }) {
    return _then(_$GetChartDataImpl(
      xVal: freezed == xVal
          ? _value.xVal
          : xVal // ignore: cast_nullable_to_non_nullable
              as String?,
      yVal: freezed == yVal
          ? _value.yVal
          : yVal // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetChartDataImpl implements _GetChartData {
  const _$GetChartDataImpl(
      {required this.xVal, required this.yVal, required this.type});

  factory _$GetChartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetChartDataImplFromJson(json);

  @override
  final String? xVal;
  @override
  final String? yVal;
  @override
  final String? type;

  @override
  String toString() {
    return 'GetChartData(xVal: $xVal, yVal: $yVal, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetChartDataImpl &&
            (identical(other.xVal, xVal) || other.xVal == xVal) &&
            (identical(other.yVal, yVal) || other.yVal == yVal) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, xVal, yVal, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetChartDataImplCopyWith<_$GetChartDataImpl> get copyWith =>
      __$$GetChartDataImplCopyWithImpl<_$GetChartDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetChartDataImplToJson(
      this,
    );
  }
}

abstract class _GetChartData implements GetChartData {
  const factory _GetChartData(
      {required final String? xVal,
      required final String? yVal,
      required final String? type}) = _$GetChartDataImpl;

  factory _GetChartData.fromJson(Map<String, dynamic> json) =
      _$GetChartDataImpl.fromJson;

  @override
  String? get xVal;
  @override
  String? get yVal;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$GetChartDataImplCopyWith<_$GetChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
