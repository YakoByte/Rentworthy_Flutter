import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/home/home_repo.dart';

abstract class HomeService {
  Future<Map<String, dynamic>?> userGetCategory();
  Future<Map<String, dynamic>?> userGetProduct();
}

class HomeServiceV1 implements HomeService {
  HomeServiceV1(
    this.homeRepository,
  );

  final HomeRepository homeRepository;
@override
  Future<Map<String, dynamic>?> userGetCategory(){
    return homeRepository.userGetCategory();
  }@override
  Future<Map<String, dynamic>?> userGetProduct(){
    return homeRepository.userGetProduct();
  }
}

final homeServiceProvider = Provider.autoDispose<HomeService>((ref) {
  final service = HomeServiceV1(
    ref.watch(homeRepositoryProvider),
  );
  return service;
});
