import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_chat.freezed.dart';

part 'get_chat.g.dart';

@freezed
abstract class GetChat with _$GetChat {
  const factory GetChat({
    required bool? success,
    required String? message,
    required List<ChatData>? data,
  }) = _GetChat;

  factory GetChat.fromJson(Map<String, dynamic> json) =>
      _$GetChatFromJson(json);
}

@freezed
abstract class ChatData with _$ChatData {
  const factory ChatData({
    required String? rec_user_id,
    required String? rec_user_name,
    required String? rec_user_img,
    required String? product_id,
    required String? product_name,
    required String? product_img,
    required String? product_chat_id,
    required String? last_msg,
    required String? last_msg_time,
  }) = _ChatData;

  factory ChatData.fromJson(Map<String, dynamic> json) =>
      _$ChatDataFromJson(json);
}
