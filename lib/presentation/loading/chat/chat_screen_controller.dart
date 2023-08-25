import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_screen_controller.g.dart';

@riverpod
class ChatScreenController extends _$ChatScreenController {
  TextEditingController textEditingController = TextEditingController();
  late ScrollController scrollController = ScrollController();

  List<String> questionList = [
    "Do you offer extended rentals?",
    "Is it available?",
    "Do you deliver?",
    "What’s your location?",
    "How is the condition of this item?"
  ];

  List<String> get getquestionList => questionList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());

    state = const AsyncValue.data(null);
  }

  _scrollToEnd() async {
    if (scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }
}
