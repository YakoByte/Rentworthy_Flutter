import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/business_prof/track_item/track_item_repo.dart';
import '../../../data/indi_prof/address/address_repo.dart';
import '../../../model/business_prof/track_item/get_track_item/get_track_item.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';

abstract class TrackItemService {
  Future<TrackingItemResponse?> getTrackingItem();
}

class TrackItemServiceV1 implements TrackItemService {
  TrackItemServiceV1(
    this.trackItemRepository,
  );

  final TrackItemRepository trackItemRepository;

  @override
  Future<TrackingItemResponse?> getTrackingItem() async {
    return await trackItemRepository.getTrackingItem();
  }
}

final trackItemServiceProvider = Provider.autoDispose<TrackItemService>((ref) {
  final service = TrackItemServiceV1(
    ref.watch(trackItemRepositoryProvider),
  );
  return service;
});
