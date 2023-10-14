import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/indi_prof/chat/get_chat/get_chat.dart';
import '../../../utils/import_utils.dart';

abstract class ChatRepository {
  Future<GetChat?> getChatData();
}

class ChatRepositoryV1 extends ChatRepository {
  final List<ChatData> _onChatList = [
    const ChatData(
        rec_user_id: "1",
        rec_user_name: "User 1",
        rec_user_img: AppImg.xbox,
        product_id: "1",
        product_name: "Product 1",
        product_img: AppImg.xbox,
        product_chat_id: "1",
        last_msg: "Last Message",
        last_msg_time: "10:00 AM"),
  ];

  List<ChatData>? get onChatList => _onChatList;

  @override
  Future<GetChat?> getChatData() async {
    return GetChat(success: true, message: "OK", data: _onChatList);
  }
}

final chatRepositoryProvider =
    Provider<ChatRepository>((ref) => ChatRepositoryV1());
