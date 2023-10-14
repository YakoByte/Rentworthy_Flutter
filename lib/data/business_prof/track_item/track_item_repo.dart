import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/business_prof/track_item/get_track_item/get_track_item.dart';
import '../../../utils/import_utils.dart';

abstract class TrackItemRepository {
  Future<TrackingItemResponse?> getTrackingItem();
}

class TrackItemRepositoryV1 extends TrackItemRepository {
  final List<TrackingItemData> _onTrackItemData = [
    const TrackingItemData(
      track_item_id: "1",
      product_name: "Xbox Series S",
      desc:
          "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint.",
      track_type: "Rented",
      thumbnail: AppImg.xbox,
      order_place_date: "2021-08-01",
      renter_name: "John Doe",
      order_id: "0987-654321",
      order_status: "Pending",
      shipping_address: "1234 Main St, New York, NY 10030",
      payment_method: "Credit Card",
      item_subtotal: "\$768.00",
      item_total: "\$768.00",
    ),
  ];

  List<TrackingItemData>? get onTrackItemData => _onTrackItemData;

  @override
  Future<TrackingItemResponse?> getTrackingItem() async {
    return TrackingItemResponse(
        success: true, message: "OK", data: _onTrackItemData);
  }
}

final trackItemRepositoryProvider =
    Provider<TrackItemRepository>((ref) => TrackItemRepositoryV1());
