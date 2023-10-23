import 'package:carousel_slider/carousel_controller.dart';
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
  final List<String> _locationList = [
    'Wagle state',
    'Mumbra',
    'Mulund',
    'Dadar',
    'Mahim',
  ];
  List<String> filterlist = [
    "Distance",
    "Pricing",
    "Pickup Only",
    "Delivery Only",
    "Both Pickup & Delivery",
  ];

  List<String> get getfilterlist => filterlist;
  List<String> carlist = [
    "Mercedes",
    "MG",
    "Kia",
    "Hyundai",
    "Tata",
    "Honda",
    "Suzuki",
    "AUdi",
    "BMW",
    "Ford",
    "Toyota",
    "Renault",
    "Porsche",
    "Ferrari",
    "Volvo",
  ];

  List<String> get getcarlist => carlist;
  List<String>? selectedfilter;
  TextEditingController searchController = TextEditingController();
  String transcription = '';

  List<String> get getselectedfilter => selectedfilter!;
  List<bool>? favlist;

  List<bool> get getfavlist => favlist!;
  List<String> sortlist = [
    "New listings",
    "Best Reviews",
    "Most Expensive",
    "Least Expensive",
  ];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final SpeechRecognition _speech = SpeechRecognition();

  SpeechRecognition get speech => _speech;
  bool _speechRecognitionAvailable = false;

  bool get speechRecognitionAvailable => _speechRecognitionAvailable;
  bool _isListening = false;
  AnimationController? animationController;

  bool get isListening => _isListening;

  List<String> get getsortlist => sortlist;
  List<String>? selectedsortby;

  List<String> get getselectedsortby => selectedsortby!;
  List<String> searchitems = [];

  List<String> get getsearchitems => searchitems;
  bool? checkboxitems = false;

  bool get getcheckboxitems => checkboxitems!;

  List<bool>? featureadfavlist;

  List<bool> get getfeatureadfavlist => featureadfavlist!;

  List<bool>? nearbyadfavlist;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  List<String> get locationList => _locationList;
  List<AnimationController>? animatecontrollerlist = [];

  CarouselController carouselController = CarouselController();
  PageController pageController = PageController();

  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeoutdoor,
    AppImg.electronics,
    AppImg.star,
    AppImg.guitar,
    AppImg.cleaner,
    AppImg.clothing,
    AppImg.setting,
    AppImg.newtag,
  ];

  List<String> get imgList => _imgList;
  final List<String> _nameList = [
    AppText.film,
    AppText.partyevents,
    AppText.homeoutdoor,
    AppText.electronics,
    AppText.toprent,
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavymachine,
    AppText.newmarket,
  ];

  List<String> get nameList => _nameList;
  List<String>? _selectedLocation;

  List<String>? get selectedLocation => _selectedLocation;

  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    selectedfilter = filterlist;
    selectedsortby = sortlist;
    favlist = List.generate(carlist.length, (index) => false);
    state = const AsyncValue.data(null);
    _selectedLocation = _locationList;
    activateSpeechRecognizer();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: CommonTickerProvider(),
    )..repeat();
    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);
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

  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    state = const AsyncLoading();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.setErrorHandler(errorHandler);
    _speech.activate('en_US').then((res) {
      _speechRecognitionAvailable = res;
      print("resres $res");
    });
    state = const AsyncValue.data(null);
  }

  void start() => _speech.activate("en_US").then((_) {
        return _speech.listen().then((result) {
          print('_MyAppState.start => result $result');
          state = const AsyncLoading();
          // animationController!.forward();
          _isListening = result;

          state = const AsyncValue.data(null);
        });
      });

  void cancel() => _speech.cancel().then((_) {
        state = const AsyncLoading();
        print("cancel");
        _isListening = false;
        state = const AsyncValue.data(null);
      });

  void stop() => _speech.stop().then((_) {
        state = const AsyncLoading();
        print("stop");
        _isListening = false;
        state = const AsyncValue.data(null);
      });

  void onSpeechAvailability(bool result) {
    state = const AsyncLoading();
    print("onSpeechAvailability");
    _speechRecognitionAvailable = result;
    state = const AsyncValue.data(null);
  }

  void onRecognitionStarted() {
    state = const AsyncLoading();
    print("Listening");
    _isListening = true;
    searchController.text = 'Listening...';
    state = const AsyncValue.data(null);
  }

  void onRecognitionResult(String text) {
    print('_MyAppState.onRecognitionResult... $text');
    //  state = const AsyncLoading();
    transcription = text;

    searchController.text = 'Listening...';
    searchController.text = text.capitalize().substring(0);
    state = const AsyncValue.data(null);
  }

  void onRecognitionComplete(String text) {
    print('_MyAppState.onRecognitionComplete... $text');
    state = const AsyncLoading();

    Future.delayed(const Duration(milliseconds: 400), () {
      state = const AsyncLoading();
      _isListening = false;
      state = const AsyncValue.data(null);
    });

    state = const AsyncValue.data(null);
  }

  void errorHandler() => activateSpeechRecognizer();

  onchangefilter(
    val,
  ) {
    state = const AsyncLoading();
    selectedfilter = val;
    state = const AsyncValue.data(null);
  }

  onchangecheckbox(
    val,
  ) {
    state = const AsyncLoading();
    checkboxitems = val;
    print("checkboxitems $checkboxitems");
    state = const AsyncValue.data(null);
  }

  void filterSearchResults(String query) {
    state = const AsyncLoading();
    searchitems = carlist
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print("searchitems $searchitems");
    state = const AsyncValue.data(null);
  }

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

  onchangesorting(
    val,
  ) {
    state = const AsyncLoading();
    selectedsortby = val;

    state = const AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }

  onValSelect({required List<String> val}) async {
    state = const AsyncLoading();
    _selectedLocation = val;
    state = const AsyncValue.data(null);
  }
}
