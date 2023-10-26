import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/chat/chat_repo.dart';
import '../../../model/indi_prof/chat/get_chat/get_chat.dart';

abstract class ChatService {
  Future<GetChat?> getChatData();
}

class ChatServiceV1 implements ChatService {
  ChatServiceV1(
    this.chatRepository,
  );

  final ChatRepository chatRepository;

  @override
  Future<GetChat?> getChatData() async {
    return await chatRepository.getChatData();
  }
}

final chatServiceProvider = Provider.autoDispose<ChatService>((ref) {
  final service = ChatServiceV1(
    ref.watch(chatRepositoryProvider),
  );
  return service;
});
