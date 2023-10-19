import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/both_prof/onboarding/onboarding_repo.dart';
import '../../model/onboarding/onboarding.dart';

abstract class OnBoardingService {
  @override
  Future<List<OnBoardingitem>?> getboardingdata();
}

class OnBoardingServiceV1 implements OnBoardingService {
  OnBoardingServiceV1(
    this.onBoardingRepository,
  );

  final OnBoardingRepository onBoardingRepository;

  @override
  Future<List<OnBoardingitem>?> getboardingdata() async {
    return await onBoardingRepository.getboardingdata();
  }
}

final onBoardingServiceProvider =
    Provider.autoDispose<OnBoardingService>((ref) {
  final service = OnBoardingServiceV1(
    ref.watch(onBoardingRepositoryProvider),
  );
  return service;
});
