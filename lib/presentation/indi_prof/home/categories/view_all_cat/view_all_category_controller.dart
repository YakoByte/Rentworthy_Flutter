import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/common_components/common_tickerprovider.dart';

part 'view_all_category_controller.g.dart';

@riverpod
class ViewAllCategoryController extends _$ViewAllCategoryController {
  List<String> filterlist = [
    "Distance",
    "Pricing",
    "Pickup Only",
    "Delivery Only",
    "Both Pickup & Delivery",
  ];

  List<String> get getfilterlist => filterlist;

  List<String>? selectedfilter;

  List<String> get getselectedfilter => selectedfilter!;
  TextEditingController searchController = TextEditingController();
  String transcription = '';

  List<bool>? favlist;

  List<bool> get getfavlist => favlist!;
  List<String> sortlist = [
    "New listings",
    "Best Reviews",
    "Most Expensive",
    "Least Expensive",
  ];

  List<String> get getsortlist => sortlist;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final SpeechRecognition _speech = SpeechRecognition();

  SpeechRecognition get speech => _speech;
  bool _speechRecognitionAvailable = false;

  bool get speechRecognitionAvailable => _speechRecognitionAvailable;
  bool _isListening = false;
  AnimationController? animationController;

  bool get isListening => _isListening;

  List<String>? selectedsortby;

  List<String> get getselectedsortby => selectedsortby!;

  List<AnimationController>? animatecontrollerlist = [];

  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeOutDoor,
    AppImg.electronics,
    AppImg.star,
    AppImg.guitar,
    AppImg.cleaner,
    AppImg.clothing,
    AppImg.setting,
    AppImg.newTag,
  ];

  List<String> get imgList => _imgList;
  final List<String> _nameList = [
    AppText.film,
    AppText.partyEvents,
    AppText.homeOutDoor,
    AppText.electronics,
    AppText.topRent,
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavyMachine,
    AppText.newMarket,
  ];

  List<String> get nameList => _nameList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    selectedfilter = filterlist;
    selectedsortby = sortlist;
    favlist = List.generate(15, (index) => false);
    state = const AsyncValue.data(null);
    activateSpeechRecognizer();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: CommonTickerProvider(),
    )..repeat();
    Future.delayed(const Duration(seconds: 1), () {
      for (int i = 0; i < _nameList.length; i++) {
        animatecontrollerlist!.add(AnimationController(
          vsync: CommonTickerProvider(),
          duration: Duration(
              milliseconds:
                  ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
        ));
        Future.delayed(const Duration(milliseconds: 400), () {
          animatecontrollerlist![0].forward();
          if (i != (animatecontrollerlist!.length - 1)) {
            animatecontrollerlist![i + 1].forward();
          }
        });
      }
      _isLoading = false;
      state = const AsyncValue.data(null);
    });

    state = const AsyncValue.data(null);
  }

  /// This function is used to activate speech recognizer
  void activateSpeechRecognizer() {
    // debugPrint('_MyAppState.activateSpeechRecognizer... ');
    state = const AsyncLoading();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('en_US').then((res) {
      _speechRecognitionAvailable = res;
      //  debugPrint("resres $res");
    });
    state = const AsyncValue.data(null);
  }

  /// This function is used to start speech recognizer
  void start() => _speech.activate("en_US").then((_) {
        return _speech.listen().then((result) {
          // debugPrint('_MyAppState.start => result $result');
          state = const AsyncLoading();
          // animationController!.forward();
          _isListening = result;

          state = const AsyncValue.data(null);
        });
      });

  /// This function is used to cancel speech recognizer
  void cancel() => _speech.cancel().then((_) {
        state = const AsyncLoading();
        // debugPrint("cancel");
        _isListening = false;
        state = const AsyncValue.data(null);
      });

  /// This function is used to stop speech recognizer
  void stop() => _speech.stop().then((_) {
        state = const AsyncLoading();
        //  debugPrint("stop");
        _isListening = false;
        searchController.text = "";
        state = const AsyncValue.data(null);
      });

  /// This function is used to check speech recognizer availability
  void onSpeechAvailability(bool result) {
    state = const AsyncLoading();
    //  debugPrint("onSpeechAvailability");
    _speechRecognitionAvailable = result;
    state = const AsyncValue.data(null);
  }

  /// This function is used to speech recognizer start
  void onRecognitionStarted() {
    state = const AsyncLoading();
    // debugPrint("Listening");
    _isListening = true;
    searchController.text = 'Listening...';
    state = const AsyncValue.data(null);
  }

  /// This function is used to speech recognizer result
  void onRecognitionResult(String text) {
    //  debugPrint('_MyAppState.onRecognitionResult... $text');
    //  state = const AsyncLoading();
    transcription = text;

    searchController.text = 'Listening...';
    searchController.text = text.capitalize().substring(0);
    state = const AsyncValue.data(null);
  }

  /// This function is used to speech recognizer complete
  void onRecognitionComplete(String text) {
    // debugPrint('_MyAppState.onRecognitionComplete... $text');
    state = const AsyncLoading();

    Future.delayed(const Duration(milliseconds: 400), () {
      state = const AsyncLoading();
      _isListening = false;
      state = const AsyncValue.data(null);
    });

    state = const AsyncValue.data(null);
  }

  /// This function is used to speech recognizer error
  void errorHandler() => activateSpeechRecognizer();

  /// This function is used to change filter
  onchangefilter(
    val,
  ) {
    state = const AsyncLoading();
    selectedfilter = val;
    state = const AsyncValue.data(null);
  }

  /// This function is used to change fav
  onFavTap(
    int index,
  ) {
    state = const AsyncLoading();
    if (favlist![index] == true) {
      favlist![index] = false;
    } else {
      favlist![index] = true;
    }

    state = const AsyncValue.data(null);
  }

  /// This function is used to change sort
  onchangesorting(
    val,
  ) {
    state = const AsyncLoading();
    selectedsortby = val;

    state = const AsyncValue.data(null);
  }
}
