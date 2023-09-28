// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnBoardingModel {
  String get img => throw _privateConstructorUsedError;
  String get titletext => throw _privateConstructorUsedError;
  String get subtitletext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnBoardingModelCopyWith<OnBoardingModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingModelCopyWith<$Res> {
  factory $OnBoardingModelCopyWith(
          OnBoardingModel value, $Res Function(OnBoardingModel) then) =
      _$OnBoardingModelCopyWithImpl<$Res, OnBoardingModel>;
  @useResult
  $Res call({String img, String titletext, String subtitletext});
}

/// @nodoc
class _$OnBoardingModelCopyWithImpl<$Res, $Val extends OnBoardingModel>
    implements $OnBoardingModelCopyWith<$Res> {
  _$OnBoardingModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? img = null,
    Object? titletext = null,
    Object? subtitletext = null,
  }) {
    return _then(_value.copyWith(
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      titletext: null == titletext
          ? _value.titletext
          : titletext // ignore: cast_nullable_to_non_nullable
              as String,
      subtitletext: null == subtitletext
          ? _value.subtitletext
          : subtitletext // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnBoardingModelImplCopyWith<$Res>
    implements $OnBoardingModelCopyWith<$Res> {
  factory _$$OnBoardingModelImplCopyWith(_$OnBoardingModelImpl value,
          $Res Function(_$OnBoardingModelImpl) then) =
      __$$OnBoardingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String img, String titletext, String subtitletext});
}

/// @nodoc
class __$$OnBoardingModelImplCopyWithImpl<$Res>
    extends _$OnBoardingModelCopyWithImpl<$Res, _$OnBoardingModelImpl>
    implements _$$OnBoardingModelImplCopyWith<$Res> {
  __$$OnBoardingModelImplCopyWithImpl(
      _$OnBoardingModelImpl _value, $Res Function(_$OnBoardingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? img = null,
    Object? titletext = null,
    Object? subtitletext = null,
  }) {
    return _then(_$OnBoardingModelImpl(
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      titletext: null == titletext
          ? _value.titletext
          : titletext // ignore: cast_nullable_to_non_nullable
              as String,
      subtitletext: null == subtitletext
          ? _value.subtitletext
          : subtitletext // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnBoardingModelImpl implements _OnBoardingModel {
  const _$OnBoardingModelImpl(
      {required this.img, required this.titletext, required this.subtitletext});

  @override
  final String img;
  @override
  final String titletext;
  @override
  final String subtitletext;

  @override
  String toString() {
    return 'OnBoardingModel(img: $img, titletext: $titletext, subtitletext: $subtitletext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnBoardingModelImpl &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.titletext, titletext) ||
                other.titletext == titletext) &&
            (identical(other.subtitletext, subtitletext) ||
                other.subtitletext == subtitletext));
  }

  @override
  int get hashCode => Object.hash(runtimeType, img, titletext, subtitletext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnBoardingModelImplCopyWith<_$OnBoardingModelImpl> get copyWith =>
      __$$OnBoardingModelImplCopyWithImpl<_$OnBoardingModelImpl>(
          this, _$identity);
}

abstract class _OnBoardingModel implements OnBoardingModel {
  const factory _OnBoardingModel(
      {required final String img,
      required final String titletext,
      required final String subtitletext}) = _$OnBoardingModelImpl;

  @override
  String get img;
  @override
  String get titletext;
  @override
  String get subtitletext;
  @override
  @JsonKey(ignore: true)
  _$$OnBoardingModelImplCopyWith<_$OnBoardingModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
