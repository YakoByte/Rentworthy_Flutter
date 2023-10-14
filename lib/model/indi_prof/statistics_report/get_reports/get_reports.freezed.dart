// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_reports.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetReport _$GetReportFromJson(Map<String, dynamic> json) {
  return _GetReport.fromJson(json);
}

/// @nodoc
mixin _$GetReport {
  bool? get success => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  List<ReportData>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetReportCopyWith<GetReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetReportCopyWith<$Res> {
  factory $GetReportCopyWith(GetReport value, $Res Function(GetReport) then) =
      _$GetReportCopyWithImpl<$Res, GetReport>;
  @useResult
  $Res call({bool? success, String? message, List<ReportData>? data});
}

/// @nodoc
class _$GetReportCopyWithImpl<$Res, $Val extends GetReport>
    implements $GetReportCopyWith<$Res> {
  _$GetReportCopyWithImpl(this._value, this._then);

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
              as List<ReportData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetReportImplCopyWith<$Res>
    implements $GetReportCopyWith<$Res> {
  factory _$$GetReportImplCopyWith(
          _$GetReportImpl value, $Res Function(_$GetReportImpl) then) =
      __$$GetReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? success, String? message, List<ReportData>? data});
}

/// @nodoc
class __$$GetReportImplCopyWithImpl<$Res>
    extends _$GetReportCopyWithImpl<$Res, _$GetReportImpl>
    implements _$$GetReportImplCopyWith<$Res> {
  __$$GetReportImplCopyWithImpl(
      _$GetReportImpl _value, $Res Function(_$GetReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = freezed,
    Object? message = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GetReportImpl(
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
              as List<ReportData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetReportImpl implements _GetReport {
  const _$GetReportImpl(
      {required this.success,
      required this.message,
      required final List<ReportData>? data})
      : _data = data;

  factory _$GetReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetReportImplFromJson(json);

  @override
  final bool? success;
  @override
  final String? message;
  final List<ReportData>? _data;
  @override
  List<ReportData>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetReport(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetReportImpl &&
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
  _$$GetReportImplCopyWith<_$GetReportImpl> get copyWith =>
      __$$GetReportImplCopyWithImpl<_$GetReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetReportImplToJson(
      this,
    );
  }
}

abstract class _GetReport implements GetReport {
  const factory _GetReport(
      {required final bool? success,
      required final String? message,
      required final List<ReportData>? data}) = _$GetReportImpl;

  factory _GetReport.fromJson(Map<String, dynamic> json) =
      _$GetReportImpl.fromJson;

  @override
  bool? get success;
  @override
  String? get message;
  @override
  List<ReportData>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GetReportImplCopyWith<_$GetReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReportData _$ReportDataFromJson(Map<String, dynamic> json) {
  return _ReportData.fromJson(json);
}

/// @nodoc
mixin _$ReportData {
  String? get id => throw _privateConstructorUsedError;
  String? get report_title => throw _privateConstructorUsedError;
  String? get report_subtitle => throw _privateConstructorUsedError;
  String? get report_val => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDataCopyWith<ReportData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDataCopyWith<$Res> {
  factory $ReportDataCopyWith(
          ReportData value, $Res Function(ReportData) then) =
      _$ReportDataCopyWithImpl<$Res, ReportData>;
  @useResult
  $Res call(
      {String? id,
      String? report_title,
      String? report_subtitle,
      String? report_val});
}

/// @nodoc
class _$ReportDataCopyWithImpl<$Res, $Val extends ReportData>
    implements $ReportDataCopyWith<$Res> {
  _$ReportDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? report_title = freezed,
    Object? report_subtitle = freezed,
    Object? report_val = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      report_title: freezed == report_title
          ? _value.report_title
          : report_title // ignore: cast_nullable_to_non_nullable
              as String?,
      report_subtitle: freezed == report_subtitle
          ? _value.report_subtitle
          : report_subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      report_val: freezed == report_val
          ? _value.report_val
          : report_val // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportDataImplCopyWith<$Res>
    implements $ReportDataCopyWith<$Res> {
  factory _$$ReportDataImplCopyWith(
          _$ReportDataImpl value, $Res Function(_$ReportDataImpl) then) =
      __$$ReportDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? report_title,
      String? report_subtitle,
      String? report_val});
}

/// @nodoc
class __$$ReportDataImplCopyWithImpl<$Res>
    extends _$ReportDataCopyWithImpl<$Res, _$ReportDataImpl>
    implements _$$ReportDataImplCopyWith<$Res> {
  __$$ReportDataImplCopyWithImpl(
      _$ReportDataImpl _value, $Res Function(_$ReportDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? report_title = freezed,
    Object? report_subtitle = freezed,
    Object? report_val = freezed,
  }) {
    return _then(_$ReportDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      report_title: freezed == report_title
          ? _value.report_title
          : report_title // ignore: cast_nullable_to_non_nullable
              as String?,
      report_subtitle: freezed == report_subtitle
          ? _value.report_subtitle
          : report_subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      report_val: freezed == report_val
          ? _value.report_val
          : report_val // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDataImpl implements _ReportData {
  const _$ReportDataImpl(
      {required this.id,
      required this.report_title,
      required this.report_subtitle,
      required this.report_val});

  factory _$ReportDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDataImplFromJson(json);

  @override
  final String? id;
  @override
  final String? report_title;
  @override
  final String? report_subtitle;
  @override
  final String? report_val;

  @override
  String toString() {
    return 'ReportData(id: $id, report_title: $report_title, report_subtitle: $report_subtitle, report_val: $report_val)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.report_title, report_title) ||
                other.report_title == report_title) &&
            (identical(other.report_subtitle, report_subtitle) ||
                other.report_subtitle == report_subtitle) &&
            (identical(other.report_val, report_val) ||
                other.report_val == report_val));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, report_title, report_subtitle, report_val);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDataImplCopyWith<_$ReportDataImpl> get copyWith =>
      __$$ReportDataImplCopyWithImpl<_$ReportDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDataImplToJson(
      this,
    );
  }
}

abstract class _ReportData implements ReportData {
  const factory _ReportData(
      {required final String? id,
      required final String? report_title,
      required final String? report_subtitle,
      required final String? report_val}) = _$ReportDataImpl;

  factory _ReportData.fromJson(Map<String, dynamic> json) =
      _$ReportDataImpl.fromJson;

  @override
  String? get id;
  @override
  String? get report_title;
  @override
  String? get report_subtitle;
  @override
  String? get report_val;
  @override
  @JsonKey(ignore: true)
  _$$ReportDataImplCopyWith<_$ReportDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
