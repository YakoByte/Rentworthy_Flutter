// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_screen_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnBoardingScreenState {
  List<OnBoardingitem>? get onBoardinglist =>
      throw _privateConstructorUsedError;
  PageController? get pageController => throw _privateConstructorUsedError;
  int? get currentpageIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OnBoardingScreenStateCopyWith<OnBoardingScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnBoardingScreenStateCopyWith<$Res> {
  factory $OnBoardingScreenStateCopyWith(OnBoardingScreenState value,
          $Res Function(OnBoardingScreenState) then) =
      _$OnBoardingScreenStateCopyWithImpl<$Res, OnBoardingScreenState>;
  @useResult
  $Res call(
      {List<OnBoardingitem>? onBoardinglist,
      PageController? pageController,
      int? currentpageIndex});
}

/// @nodoc
class _$OnBoardingScreenStateCopyWithImpl<$Res,
        $Val extends OnBoardingScreenState>
    implements $OnBoardingScreenStateCopyWith<$Res> {
  _$OnBoardingScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onBoardinglist = freezed,
    Object? pageController = freezed,
    Object? currentpageIndex = freezed,
  }) {
    return _then(_value.copyWith(
      onBoardinglist: freezed == onBoardinglist
          ? _value.onBoardinglist
          : onBoardinglist // ignore: cast_nullable_to_non_nullable
              as List<OnBoardingitem>?,
      pageController: freezed == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController?,
      currentpageIndex: freezed == currentpageIndex
          ? _value.currentpageIndex
          : currentpageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnBoardingScreenStateImplCopyWith<$Res>
    implements $OnBoardingScreenStateCopyWith<$Res> {
  factory _$$OnBoardingScreenStateImplCopyWith(
          _$OnBoardingScreenStateImpl value,
          $Res Function(_$OnBoardingScreenStateImpl) then) =
      __$$OnBoardingScreenStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<OnBoardingitem>? onBoardinglist,
      PageController? pageController,
      int? currentpageIndex});
}

/// @nodoc
class __$$OnBoardingScreenStateImplCopyWithImpl<$Res>
    extends _$OnBoardingScreenStateCopyWithImpl<$Res,
        _$OnBoardingScreenStateImpl>
    implements _$$OnBoardingScreenStateImplCopyWith<$Res> {
  __$$OnBoardingScreenStateImplCopyWithImpl(_$OnBoardingScreenStateImpl _value,
      $Res Function(_$OnBoardingScreenStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onBoardinglist = freezed,
    Object? pageController = freezed,
    Object? currentpageIndex = freezed,
  }) {
    return _then(_$OnBoardingScreenStateImpl(
      onBoardinglist: freezed == onBoardinglist
          ? _value._onBoardinglist
          : onBoardinglist // ignore: cast_nullable_to_non_nullable
              as List<OnBoardingitem>?,
      pageController: freezed == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController?,
      currentpageIndex: freezed == currentpageIndex
          ? _value.currentpageIndex
          : currentpageIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$OnBoardingScreenStateImpl extends _OnBoardingScreenState {
  const _$OnBoardingScreenStateImpl(
      {required final List<OnBoardingitem>? onBoardinglist,
      required this.pageController,
      required this.currentpageIndex})
      : _onBoardinglist = onBoardinglist,
        super._();

  final List<OnBoardingitem>? _onBoardinglist;
  @override
  List<OnBoardingitem>? get onBoardinglist {
    final value = _onBoardinglist;
    if (value == null) return null;
    if (_onBoardinglist is EqualUnmodifiableListView) return _onBoardinglist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PageController? pageController;
  @override
  final int? currentpageIndex;

  @override
  String toString() {
    return 'OnBoardingScreenState(onBoardinglist: $onBoardinglist, pageController: $pageController, currentpageIndex: $currentpageIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnBoardingScreenStateImpl &&
            const DeepCollectionEquality()
                .equals(other._onBoardinglist, _onBoardinglist) &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController) &&
            (identical(other.currentpageIndex, currentpageIndex) ||
                other.currentpageIndex == currentpageIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_onBoardinglist),
      pageController,
      currentpageIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnBoardingScreenStateImplCopyWith<_$OnBoardingScreenStateImpl>
      get copyWith => __$$OnBoardingScreenStateImplCopyWithImpl<
          _$OnBoardingScreenStateImpl>(this, _$identity);
}

abstract class _OnBoardingScreenState extends OnBoardingScreenState {
  const factory _OnBoardingScreenState(
      {required final List<OnBoardingitem>? onBoardinglist,
      required final PageController? pageController,
      required final int? currentpageIndex}) = _$OnBoardingScreenStateImpl;
  const _OnBoardingScreenState._() : super._();

  @override
  List<OnBoardingitem>? get onBoardinglist;
  @override
  PageController? get pageController;
  @override
  int? get currentpageIndex;
  @override
  @JsonKey(ignore: true)
  _$$OnBoardingScreenStateImplCopyWith<_$OnBoardingScreenStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
