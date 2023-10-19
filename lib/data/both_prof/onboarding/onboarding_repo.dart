import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../model/onboarding/onboarding.dart';

abstract class OnBoardingRepository {
  Future<List<OnBoardingitem>?> getboardingdata();
}

class OnBoardingRepositoryV1 extends OnBoardingRepository {
  List<OnBoardingitem>? get onBoardingModelList => onBoardinglist;
  List<OnBoardingitem>? onBoardinglist = [
    const OnBoardingModel(
        img: AppImg.boardimg,
        titletext: AppText.loremipsum,
        subtitletext: AppText.loremipsum2),
    const OnBoardingModel(
        img: AppImg.boardimg1,
        titletext: AppText.loremipsum,
        subtitletext: AppText.loremipsum2),
    const OnBoardingModel(
        img: AppImg.boardimg2,
        titletext: AppText.loremipsum,
        subtitletext: AppText.loremipsum2),
  ];

  @override
  Future<List<OnBoardingitem>?> getboardingdata() async {
    return onBoardingModelList;
  }
}

final onBoardingRepositoryProvider =
    Provider<OnBoardingRepository>((ref) => OnBoardingRepositoryV1());
