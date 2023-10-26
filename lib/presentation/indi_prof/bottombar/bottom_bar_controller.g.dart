// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_bar_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bottomBarControllerHash() =>
    r'238783d631ed54e6f66d16132413afbb4477a3fc';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$BottomBarController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int? index;

  FutureOr<void> build({
    int? index,
  });
}

/// See also [BottomBarController].
@ProviderFor(BottomBarController)
const bottomBarControllerProvider = BottomBarControllerFamily();

/// See also [BottomBarController].
class BottomBarControllerFamily extends Family<AsyncValue<void>> {
  /// See also [BottomBarController].
  const BottomBarControllerFamily();

  /// See also [BottomBarController].
  BottomBarControllerProvider call({
    int? index,
  }) {
    return BottomBarControllerProvider(
      index: index,
    );
  }

  @override
  BottomBarControllerProvider getProviderOverride(
    covariant BottomBarControllerProvider provider,
  ) {
    return call(
      index: provider.index,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bottomBarControllerProvider';
}

/// See also [BottomBarController].
class BottomBarControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<BottomBarController, void> {
  /// See also [BottomBarController].
  BottomBarControllerProvider({
    int? index,
  }) : this._internal(
          () => BottomBarController()..index = index,
          from: bottomBarControllerProvider,
          name: r'bottomBarControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$bottomBarControllerHash,
          dependencies: BottomBarControllerFamily._dependencies,
          allTransitiveDependencies:
              BottomBarControllerFamily._allTransitiveDependencies,
          index: index,
        );

  BottomBarControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int? index;

  @override
  FutureOr<void> runNotifierBuild(
    covariant BottomBarController notifier,
  ) {
    return notifier.build(
      index: index,
    );
  }

  @override
  Override overrideWith(BottomBarController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BottomBarControllerProvider._internal(
        () => create()..index = index,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<BottomBarController, void>
      createElement() {
    return _BottomBarControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BottomBarControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BottomBarControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `index` of this provider.
  int? get index;
}

class _BottomBarControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<BottomBarController, void>
    with BottomBarControllerRef {
  _BottomBarControllerProviderElement(super.provider);

  @override
  int? get index => (origin as BottomBarControllerProvider).index;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
