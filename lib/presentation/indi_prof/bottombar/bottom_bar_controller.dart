import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/images.dart';
import '../../../utils/text.dart';

part 'bottom_bar_controller.g.dart';

@riverpod
class BottomBarController extends _$BottomBarController {
  final List<String> _tablist = [
    AppText.home,
    AppText.chats,
    AppText.bookings,
    AppText.account,
  ];
  PageController? pageController;

  List<String> get gettablist => _tablist;

  final List<String> _iconlist = [
    AppImg.home,
    AppImg.chat,
    AppImg.booking,
    AppImg.account,
  ];

  List<String> get geticonlist => _iconlist;
  final bool _load = false;

  bool get getload => _load;
  int _selectedIndex = 0;

  int get getselectedIndex => _selectedIndex;

  @override
  FutureOr<void> build({int? index}) async {
    state = AsyncLoading();
    print("indexindex $index");

    _selectedIndex = index!;
    pageController = PageController(initialPage: _selectedIndex);
    state = AsyncValue.data(null);
  }

  // Widget buildSelectedScreen() {
  //   final selectedScreen = _selectedIndex;
  //
  //   Widget screen = Container();
  //   switch (selectedScreen) {
  //     case 0:
  //       screen = HomeScreen();
  //       break;
  //     case 1:
  //       screen = ChatScreen(frombottom: true);
  //       break;
  //     case 2:
  //       Navigator.of(Globals.navigatorKey.currentContext!).push(
  //         _buildBookingScreenWithTransition(child: BookingScreen()),
  //       );
  //       break;
  //     case 3:
  //       screen = AccountScreen();
  //       break;
  //     case 4:
  //       screen = SellScreen();
  //       break;
  //     default:
  //       screen = Container();
  //   }
  //   return screen;
  // }
  //
  // PageRouteBuilder _buildBookingScreenWithTransition({required Widget child}) {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) => child,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(1.0, 0.0);
  //       const end = Offset.zero;
  //       const curve = Curves.easeInOut;
  //
  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //       var offsetAnimation = animation.drive(tween);
  //
  //       return SlideTransition(position: offsetAnimation, child: child);
  //     },
  //   );
  // }

  void onItemTapped(
    int index,
  ) {
    state = AsyncLoading();

    _selectedIndex = index;

    print('selectedIndex ${_selectedIndex}');
    state = AsyncValue.data(null);
  }
}
