import 'package:flutter/material.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/common_tickerprovider.dart';
import '../../../utils/common_components/icon_text.dart';
import '../../../utils/globals.dart';
import '../../../utils/text.dart';

part 'chat_screen_controller.g.dart';

@riverpod
class ChatScreenController extends _$ChatScreenController {
  TextEditingController messageController = TextEditingController();
  late ScrollController scrollController = ScrollController();
  AnimationController? divideranimationController;
  AnimationController? closeanimationController;

  List<String> questionList = [
    "Do you offer extended rentals?",
    "Is it available?",
    "Do you deliver?",
    "What’s your location?",
    "How is the condition of this item?"
  ];

  List<String> get getquestionList => questionList;
  List<String>? msgList;

  List<String> get getmsgList => msgList!;

  bool isShow = false;

  bool get getisShow => isShow;

  List<PopupMenuItem> _popupitemList = [];

  List<PopupMenuItem> get popupitemList => _popupitemList;

  final SpeechRecognition _speech = SpeechRecognition();

  SpeechRecognition get speech => _speech;
  bool _speechRecognitionAvailable = false;

  bool get speechRecognitionAvailable => _speechRecognitionAvailable;

  AnimationController? animationController;

  bool _isListening = false;

  bool get isListening => _isListening;
  String transcription = '';

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    divideranimationController = AnimationController(
      vsync: CommonTickerProvider(),
      duration: const Duration(milliseconds: 800),
    );
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: CommonTickerProvider(),
    )..repeat();
    msgList = [
      "sdfsfdm",
      "dfsasm",
      "aknjdsfabd",
      "asfgsjnhd",
      "ajfgsbdzfdfgdg ejijie riei he irei jmierjojeri jmroie gergero mgrjie jmogieirogjihgdh",
      "sdsfgm",
      "assfgm",
      "aknjabd",
      "ajnhd",
      "ajsbdhgdh",
    ];
    activateSpeechRecognizer();
    closeanimationController = AnimationController(
      vsync: CommonTickerProvider(),
      duration: const Duration(milliseconds: 800),
    );
    closeanimationController!.forward();
    _popupitemList = [
      PopupMenuItem(
        value: 1,
        child: IconText(
          isCenter: false,
          title: AppText.reportUser,
          textStyle: ptSansTextStyle(
              fontSize: w * 0.035,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
          subimg: false,
          preimg: true,
          preimgname: AppImg.reportUser,
          preiconsize: h * 0.03,
          preimgcolor: AppColors.black.withOpacity(0.9),
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: IconText(
          isCenter: false,
          title: AppText.block,
          textStyle: ptSansTextStyle(
              fontSize: w * 0.035,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
          subimg: false,
          preimg: true,
          preicon: Icons.block_flipped,
          preiconsize: h * 0.03,
          preimgcolor: AppColors.black.withOpacity(0.8),
        ),
      ),
    ];
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());

    state = const AsyncValue.data(null);
  }

  void activateSpeechRecognizer() {
    // print('_MyAppState.activateSp/eechRecognizer... ');
    state = const AsyncLoading();

    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('en_US').then((res) {
      _speechRecognitionAvailable = res;
      // print("resres $res");
    });
    state = const AsyncValue.data(null);
  }

  void start() => _speech.activate("en_US").then((_) {
        return _speech.listen().then((result) {
          // print('_MyAppState.start => result $result');

          state = const AsyncLoading();
          // animationController!.forward();
          _isListening = result;

          state = const AsyncValue.data(null);
        });
      });

  void cancel() => _speech.cancel().then((_) {
        state = const AsyncLoading();
        // print("cancel");
        _isListening = false;
        state = const AsyncValue.data(null);
      });

  void stop() => _speech.stop().then((_) {
        state = const AsyncLoading();
        // print("stop");
        messageController.text = "";
        _isListening = false;
        state = const AsyncValue.data(null);
      });

  void onSpeechAvailability(bool result) {
    state = const AsyncLoading();
    // print("onSpeechAvailability");
    _speechRecognitionAvailable = result;
    state = const AsyncValue.data(null);
  }

  void onRecognitionStarted() {
    state = const AsyncLoading();
    // print("Listening");
    _isListening = true;
    messageController.text = 'Listening...';
    state = const AsyncValue.data(null);
  }

  void onRecognitionResult(String text) {
    // print('_MyAppState.onRecognitionResult... $text');
    //  state = const AsyncLoading();
    transcription = text;

    messageController.text = 'Listening...';
    messageController.text = text.capitalize().substring(0);
    state = const AsyncValue.data(null);
  }

  void onRecognitionComplete(String text) {
    // print('_MyAppState.onRecognitionComplete... $text');
    state = const AsyncLoading();

    Future.delayed(const Duration(milliseconds: 400), () {
      state = const AsyncLoading();
      _isListening = false;
      state = const AsyncValue.data(null);
    });

    state = const AsyncValue.data(null);
  }

  void errorHandler() => activateSpeechRecognizer();

  openchat({required bool val}) async {
    state = const AsyncLoading();
    if (val == true) {
      divideranimationController!.duration = const Duration(milliseconds: 800);
      divideranimationController!.repeat();
      divideranimationController!.forward();
      if (divideranimationController!.isAnimating) {
        isShow = val;
        WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      }
    } else {
      isShow = val;
      closeanimationController!.forward();
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
    }

    state = const AsyncValue.data(null);
  }

  onSend() async {
    state = const AsyncLoading();
    // print("messageController ${messageController.text}");

    msgList!.add(messageController.text);
    // print("msgList ${msgList}");
    messageController.text = "";
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());

    state = const AsyncValue.data(null);
  }

  _scrollToEnd() async {
    if (scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }
}
