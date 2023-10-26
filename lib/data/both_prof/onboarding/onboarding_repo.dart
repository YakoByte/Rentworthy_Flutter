import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../model/onboarding/onboarding.dart';

abstract class OnBoardingRepository {
  Future<List<OnBoardingitem>?> getBoardingData();
}

class OnBoardingRepositoryV1 extends OnBoardingRepository {
  List<OnBoardingitem>? get onBoardingModelList => onBoardinglist;
  List<OnBoardingitem>? onBoardinglist = [
    const OnBoardingModel(
        img: AppImg.boardImg,
        titletext: AppText.loremIpsum,
        subtitletext: AppText.loremIpsum2),
    const OnBoardingModel(
        img: AppImg.boardImg1,
        titletext: AppText.loremIpsum,
        subtitletext: AppText.loremIpsum2),
    const OnBoardingModel(
        img: AppImg.boardImg2,
        titletext: AppText.loremIpsum,
        subtitletext: AppText.loremIpsum2),
  ];

  @override
  Future<List<OnBoardingitem>?> getBoardingData() async {
    return onBoardingModelList;
  }
}

final onBoardingRepositoryProvider =
    Provider<OnBoardingRepository>((ref) => OnBoardingRepositoryV1());
