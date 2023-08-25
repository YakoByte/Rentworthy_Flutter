import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/chat/chat_widget/receive_message.dart';
import 'package:rentworthy/presentation/loading/chat/chat_widget/send_message.dart';

class ChatItem extends ConsumerWidget {
  final List item;
  final String? loginstudid;

  // final String? rid;
  final int index;

  // final ValueChanged<bool> isSelected;
  const ChatItem({
    Key? key,
    required this.index,
    required this.item,
    required this.loginstudid,
    // required this.rid
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (item.chatUserId == loginstudid) {
    return Column(
      children: [
        SendMessage(
          item: item, index: index,
          // isSelected: widget.isSelected,
        ),
        ReceiveMessage(
          item: item,
          index: index,
          // isSelected: widget.isSelected,
        ),
      ],
    );
    // } else {
    //   return ReceiveMessage(
    //     item: widget.item,
    // isSelected: widget.isSelected,
    // );
    // }
  }
}
