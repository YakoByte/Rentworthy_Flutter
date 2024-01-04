import 'dart:async';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rentworthy/application/indi_prof/home/home_service.dart';
import 'package:rentworthy/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/dialog/dialog_service.dart';

part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  final List<String> _locationList = [
    'Chicago',
    'New York',
    'Los Angeles',
    'Houston',
    'San Diego',
    'Dallas',
  ];

  List<String> get locationList => _locationList;

  List<bool> featureadfavlist = [];

  List<bool> get getfeatureadfavlist => featureadfavlist;

  List<bool>? nearbyadfavlist;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  AnimationController? appbaranimationcontroller;
  String? _currentAddress;
  Position? _currentPosition;

  Position get currentPosition => _currentPosition!;
  CarouselController carouselController = CarouselController();
  PageController rentCollection = PageController(viewportFraction: 0.45);
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
  List<String> _productimgList = [];

  List<String> get productimgList => _productimgList;
  List<String> _productList = [];

  List<String> get productList => _productList;
  final SpeechRecognition _speech = SpeechRecognition();

  SpeechRecognition get speech => _speech;
  bool _speechRecognitionAvailable = false;

  bool get speechRecognitionAvailable => _speechRecognitionAvailable;
  bool _isListening = false;
  AnimationController? animationController;

  bool get isListening => _isListening;

  String transcription = '';
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> get nameList => _nameList;
  String? _selectedLocation;

  String? get selectedLocation => _selectedLocation;
  TextEditingController searchController = TextEditingController();
  int currentpageIndex = 0;
  Map<String, dynamic>? _categoryData;

  Map<String, dynamic>? get categoryData => _categoryData;

  int get getcurrentPageIndex => currentpageIndex;

  List<AnimationController>? animatecontrollerlist = [];
  ScrollController scrollViewController = ScrollController();
  bool _showAppbar = true;

  bool get showAppbar => _showAppbar;
  bool _isScrollingDown = false;

  bool get isScrollingDown => _isScrollingDown;

  bool _show = true;

  bool get show => _show;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _selectedLocation = _locationList[0];
    activateSpeechRecognizer();
    getCurrentPosition();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: CommonTickerProvider(),
    )..repeat();
    // animationController!.stop();
    onGetCategory();
    onGetProduct();
    popularfavlist = List.generate(_imgList.length, (index) => false);

    nearbyadfavlist = List.generate(_imgList.length, (index) => false);
    appbaranimationcontroller = AnimationController(
      vsync: CommonTickerProvider(),
      duration: const Duration(milliseconds: 800),
    );

    ref.onDispose(() {
      animationController!.dispose();
      scrollViewController.dispose();
      scrollViewController.removeListener(() {});
    });
    _isLoading = true;
    for (int i = 0; i < _nameList.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
      ));
      Future.delayed(const Duration(milliseconds: 400), () {
        animatecontrollerlist![0].forward();
      });
      if (i != (animatecontrollerlist!.length - 1)) {
        animatecontrollerlist![i + 1].forward();
      }
    }

    Future.delayed(const Duration(seconds: 1), () {
      appbaranimationcontroller!.forward();
      _isLoading = false;

      state = const AsyncValue.data(null);
    });

    myScroll();
    state = const AsyncValue.data(null);
  }

  void myScroll() async {
    scrollViewController.addListener(() {
      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          _isScrollingDown = true;
          _showAppbar = false;
          hideBottomBar();
          state = const AsyncValue.data(null);
        }
      }

      if (scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          _isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
          state = const AsyncValue.data(null);
        }
      }
    });
  }

  void showBottomBar() {
    state = const AsyncLoading();
    _show = true;
    state = const AsyncValue.data(null);
  }

  void hideBottomBar() {
    state = const AsyncLoading();
    _show = false;
    state = const AsyncValue.data(null);
  }

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

  void start() => _speech.activate("en_US").then((_) {
        return _speech.listen().then((result) {
          //     debugPrint('_MyAppState.start => result $result');
          state = const AsyncLoading();
          // animationController!.forward();
          _isListening = result;

          state = const AsyncValue.data(null);
        });
      });

  void cancel() => _speech.cancel().then((_) {
        state = const AsyncLoading();
        //   debugPrint("cancel");
        _isListening = false;
        state = const AsyncValue.data(null);
      });

  void stop() => _speech.stop().then((_) {
        state = const AsyncLoading();
        // debugPrint("stop");
        searchController.text = "";
        _isListening = false;
        state = const AsyncValue.data(null);
      });

  void onSpeechAvailability(bool result) {
    state = const AsyncLoading();
    // debugPrint("onSpeechAvailability");
    _speechRecognitionAvailable = result;
    state = const AsyncValue.data(null);
  }

  void onRecognitionStarted() {
    state = const AsyncLoading();
    // debugPrint("Listening");
    _isListening = true;
    searchController.text = 'Listening...';
    state = const AsyncValue.data(null);
  }

  void onRecognitionResult(String text) {
    // debugPrint('_MyAppState.onRecognitionResult... $text');
    //  state = const AsyncLoading();
    transcription = text;

    searchController.text = 'Listening...';
    searchController.text = text.capitalize().substring(0);
    state = const AsyncValue.data(null);
  }

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

  void errorHandler() => activateSpeechRecognizer();

  onFavTap(int index, int type) {
    state = const AsyncLoading();
    if (type == 0) {
      if (featureadfavlist![index] == true) {
        featureadfavlist![index] = false;
      } else {
        featureadfavlist![index] = true;
      }
    } else if (type == 1) {
      if (nearbyadfavlist![index] == true) {
        nearbyadfavlist![index] = false;
      } else {
        nearbyadfavlist![index] = true;
      }
    } else if (type == 2) {
      if (popularfavlist![index] == true) {
        popularfavlist![index] = false;
      } else {
        popularfavlist![index] = true;
      }
    }

    state = const AsyncValue.data(null);
  }

  Future<void> getCurrentPosition() async {
    state = const AsyncLoading();
    final hasPermission =
        await ref.read(dialogServiceProvider).handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;

      // debugPrint("position $position");
      // debugPrint("_currentPosition $_currentPosition");
    }).catchError((e) {
      //  debugPrint(e);
    });
    state = const AsyncValue.data(null);
  }

  Future<void> getAddressFromLatLng(Position position) async {
    // state = const AsyncLoading();
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      Navigator.pop(Globals.navigatorKey.currentContext!);
      _selectedLocation = "${place.locality}, ${place.administrativeArea}";
      state = const AsyncValue.data(null);
      _currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      state = const AsyncValue.data(null);
      //  debugPrint("_currentAddress ${place}");
    }).catchError((e) {
      //  debugPrint(e);
    });
    // state = const AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();

    currentpageIndex = index;

    state = const AsyncValue.data(null);
  }

  onValSelect({required String val}) async {
    state = const AsyncLoading();

    _selectedLocation = val;

    state = const AsyncValue.data(null);
  }

  /// This method is used to get the category list
  Future<void> onGetCategory() async {
    state = const AsyncLoading();

    final link = ref.keepAlive();
    Timer? timer;

    _isLoading = true;
    // Future.delayed(const Duration(seconds: 1), () async {
    state = const AsyncLoading();
    // _isVerify = true;
    // startTimer();
    // ref.read(loginServiceProvider).verifyOTP(
    //     verificationId: verificationId, smsCode: otpController!.text);
    _categoryData = await ref.read(homeServiceProvider).userGetCategory();
    _nameList.clear();
    _imgList.clear();
    for (int i = 0;
        i < _categoryData!["existingCategory"]['data'].length;
        i++) {
      _nameList.add(_categoryData!["existingCategory"]['data'][i]['name']);
      _imgList.add(_categoryData!["existingCategory"]['data'][i]['image']);
    }

    state = AsyncValue.data(null);
    ref.onCancel(() {
      // start a 30 second timer
      timer = Timer(const Duration(seconds: 30), () {
        // dispose on timeout
        link.close();
      });
    });
    _isLoading = false;
  }

  Future<void> onGetProduct() async {
    state = const AsyncLoading();

    final link = ref.keepAlive();
    Timer? timer;

    _isLoading = true;
    // Future.delayed(const Duration(seconds: 1), () async {
    state = const AsyncLoading();
    // _isVerify = true;
    // startTimer();
    // ref.read(loginServiceProvider).verifyOTP(
    //     verificationId: verificationId, smsCode: otpController!.text);
    _categoryData = await ref.read(homeServiceProvider).userGetProduct();
    _productList.clear();
    _productimgList.clear();
    for (int i = 0; i < _categoryData!['data'].length; i++) {
      _productList.add(_categoryData!['data'][i]['name']);
      _productimgList.add(_categoryData!['data'][i]['images'][0]["path"]);
    }

    state = AsyncValue.data(null);
    featureadfavlist = List.generate(_productimgList.length, (index) => false);
    ref.onCancel(() {
      // start a 30 second timer
      timer = Timer(const Duration(seconds: 30), () {
        // dispose on timeout
        link.close();
      });
    });
    _isLoading = false;
    state = AsyncValue.data(null);
  }
}
