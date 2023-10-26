import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/both_prof/onboarding/onboarding_repo.dart';
import '../../model/onboarding/onboarding.dart';

abstract class OnBoardingService {
  Future<List<OnBoardingitem>?> getBoardingData();
}

class OnBoardingServiceV1 implements OnBoardingService {
  OnBoardingServiceV1(
    this.onBoardingRepository,
  );

  final OnBoardingRepository onBoardingRepository;

  @override
  Future<List<OnBoardingitem>?> getBoardingData() async {
    return await onBoardingRepository.getBoardingData();
  }
}

final onBoardingServiceProvider =
    Provider.autoDispose<OnBoardingService>((ref) {
  final service = OnBoardingServiceV1(
    ref.watch(onBoardingRepositoryProvider),
  );
  return service;
});
