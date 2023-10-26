import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/both_prof/g_map/g_map_repo.dart';
import '../../model/g_map/g_map.dart';

abstract class GMapService {
  Future<GMapResponse?> getMapData();
}

class GMapServiceV1 implements GMapService {
  GMapServiceV1(
    this.gMapRepository,
  );

  final GMapRepository gMapRepository;

  @override
  Future<GMapResponse?> getMapData() async {
    return await gMapRepository.getMapData();
  }
}

final gMapServiceProvider = Provider.autoDispose<GMapService>((ref) {
  final service = GMapServiceV1(
    ref.watch(gMapRepositoryProvider),
  );
  return service;
});
