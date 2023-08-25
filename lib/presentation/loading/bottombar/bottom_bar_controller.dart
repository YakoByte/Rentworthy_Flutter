import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_bar_controller.g.dart';

@riverpod
class BottomBarController extends _$BottomBarController {
  final List<String> _tablist = [
    AppText.home,
    AppText.chats,
    AppText.bookings,
    AppText.account,
  ];

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
    if (index != null) {
      _selectedIndex = index;
    }
    state = AsyncValue.data(null);
  }

  void onItemTapped(
    int index,
  ) {
    state = AsyncLoading();

    _selectedIndex = index;

    print('selectedIndex ${_selectedIndex}');
    state = AsyncValue.data(null);
  }
}
