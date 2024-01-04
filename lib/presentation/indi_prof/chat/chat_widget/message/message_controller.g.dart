// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messageScreenControllerHash() =>
    r'b2486de97c05f17c3c0016d08895496318da0aac';

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

abstract class _$MessageScreenController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String receiverId;
  late final String senderId;
  late final String conversationId;

  FutureOr<void> build({
    required String receiverId,
    required String senderId,
    required String conversationId,
  });
}

/// See also [MessageScreenController].
@ProviderFor(MessageScreenController)
const messageScreenControllerProvider = MessageScreenControllerFamily();

/// See also [MessageScreenController].
class MessageScreenControllerFamily extends Family<AsyncValue<void>> {
  /// See also [MessageScreenController].
  const MessageScreenControllerFamily();

  /// See also [MessageScreenController].
  MessageScreenControllerProvider call({
    required String receiverId,
    required String senderId,
    required String conversationId,
  }) {
    return MessageScreenControllerProvider(
      receiverId: receiverId,
      senderId: senderId,
      conversationId: conversationId,
    );
  }

  @override
  MessageScreenControllerProvider getProviderOverride(
    covariant MessageScreenControllerProvider provider,
  ) {
    return call(
      receiverId: provider.receiverId,
      senderId: provider.senderId,
      conversationId: provider.conversationId,
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
  String? get name => r'messageScreenControllerProvider';
}

/// See also [MessageScreenController].
class MessageScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MessageScreenController,
        void> {
  /// See also [MessageScreenController].
  MessageScreenControllerProvider({
    required String receiverId,
    required String senderId,
    required String conversationId,
  }) : this._internal(
          () => MessageScreenController()
            ..receiverId = receiverId
            ..senderId = senderId
            ..conversationId = conversationId,
          from: messageScreenControllerProvider,
          name: r'messageScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messageScreenControllerHash,
          dependencies: MessageScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              MessageScreenControllerFamily._allTransitiveDependencies,
          receiverId: receiverId,
          senderId: senderId,
          conversationId: conversationId,
        );

  MessageScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.receiverId,
    required this.senderId,
    required this.conversationId,
  }) : super.internal();

  final String receiverId;
  final String senderId;
  final String conversationId;

  @override
  FutureOr<void> runNotifierBuild(
    covariant MessageScreenController notifier,
  ) {
    return notifier.build(
      receiverId: receiverId,
      senderId: senderId,
      conversationId: conversationId,
    );
  }

  @override
  Override overrideWith(MessageScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessageScreenControllerProvider._internal(
        () => create()
          ..receiverId = receiverId
          ..senderId = senderId
          ..conversationId = conversationId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        receiverId: receiverId,
        senderId: senderId,
        conversationId: conversationId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MessageScreenController, void>
      createElement() {
    return _MessageScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageScreenControllerProvider &&
        other.receiverId == receiverId &&
        other.senderId == senderId &&
        other.conversationId == conversationId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, receiverId.hashCode);
    hash = _SystemHash.combine(hash, senderId.hashCode);
    hash = _SystemHash.combine(hash, conversationId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessageScreenControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `receiverId` of this provider.
  String get receiverId;

  /// The parameter `senderId` of this provider.
  String get senderId;

  /// The parameter `conversationId` of this provider.
  String get conversationId;
}

class _MessageScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MessageScreenController,
        void> with MessageScreenControllerRef {
  _MessageScreenControllerProviderElement(super.provider);

  @override
  String get receiverId =>
      (origin as MessageScreenControllerProvider).receiverId;
  @override
  String get senderId => (origin as MessageScreenControllerProvider).senderId;
  @override
  String get conversationId =>
      (origin as MessageScreenControllerProvider).conversationId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
