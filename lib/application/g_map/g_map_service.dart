import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/g_map/g_map_repo.dart';
import '../../data/onboarding/onboarding_repo.dart';
import '../../model/g_map/g_map.dart';
import '../../model/onboarding/onboarding.dart';

abstract class GMapService {
  @override
  Future<GMapResponse?> getmapData();
}

class GMapServiceV1 implements GMapService {
  GMapServiceV1(
    this.gMapRepository,
  );

  final GMapRepository gMapRepository;

  @override
  Future<GMapResponse?> getmapData() async {
    return await gMapRepository.getmapData();
  }
}

final gMapServiceProvider = Provider.autoDispose<GMapService>((ref) {
  final service = GMapServiceV1(
    ref.watch(gMapRepositoryProvider),
  );
  return service;
});
