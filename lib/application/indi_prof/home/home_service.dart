import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/home/home_repo.dart';
import '../../../model/indi_prof/home/get_cat/get_category.dart';
import '../../../model/indi_prof/home/get_items/get_items.dart';
import '../../../model/indi_prof/home/get_loc/get_location.dart';

abstract class HomeService {
  Future<GetCategory?> getCategoryData();

  Future<GetItem?> getItemData();

  Future<GetLocation?> getLocationData();
}

class HomeServiceV1 implements HomeService {
  HomeServiceV1(
    this.homeRepository,
  );

  final HomeRepository homeRepository;

  @override
  Future<GetCategory?> getCategoryData() async {
    return await homeRepository.getCategoryData();
  }

  @override
  Future<GetItem?> getItemData() async {
    return await homeRepository.getItemData();
  }

  @override
  Future<GetLocation?> getLocationData() async {
    return await homeRepository.getLocationData();
  }
}

final homeServiceProvider = Provider.autoDispose<HomeService>((ref) {
  final service = HomeServiceV1(
    ref.watch(homeRepositoryProvider),
  );
  return service;
});
