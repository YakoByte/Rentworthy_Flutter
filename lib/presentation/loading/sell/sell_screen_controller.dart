import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/images.dart';
import '../../../utils/text.dart';

part 'sell_screen_controller.g.dart';

@riverpod
class SellScreenController extends _$SellScreenController {
  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeoutdoor,
    AppImg.electronics,
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
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavymachine,
    AppText.newmarket,
  ];

  List<String> get nameList => _nameList;

  int? selectedIndex;

  int get getselectedIndex => selectedIndex!;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    selectedIndex = _nameList.length;
    state = const AsyncValue.data(null);
  }

  onSelect(int index) async {
    state = const AsyncLoading();
    selectedIndex = index;
    state = const AsyncValue.data(null);
  }
}
