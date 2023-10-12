import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/import_utils.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/dialog/dialod_service.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_tickerprovider.dart';

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

  ScrollController scrollController = ScrollController();
  List<bool>? featureadfavlist;

  List<bool> get getfeatureadfavlist => featureadfavlist!;

  List<bool>? nearbyadfavlist;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  List<String> get locationList => _locationList;

  String? _currentAddress;
  Position? _currentPosition;

  Position get currentPosition => _currentPosition!;
  CarouselController carouselController = CarouselController();
  PageController rentCollection = PageController(viewportFraction: 0.45);
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
  List<String> searchitems = [];
  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  List<String> get getsearchitems => searchitems;
  List<AnimationController>? animatecontrollerlist = [];

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
    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);

    ref.onDispose(() {
      animationController!.dispose();
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
    state = const AsyncLoading();
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

      debugPrint("position $position");
      debugPrint("_currentPosition $_currentPosition");
    }).catchError((e) {
      debugPrint(e);
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
      debugPrint("_currentAddress ${place}");
    }).catchError((e) {
      debugPrint(e);
    });
    // state = const AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();

    currentpageIndex = index;

    state = const AsyncValue.data(null);
  }

  void filterSearchResults(String query) {
    state = const AsyncLoading();

    // searchitems = carlist
    //    .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();

    print("searchitems $searchitems");

    state = const AsyncValue.data(null);
  }

  onValSelect({required String val}) async {
    state = const AsyncLoading();

    _selectedLocation = val;

    state = const AsyncValue.data(null);
  }
}
