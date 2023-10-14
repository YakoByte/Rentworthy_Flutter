import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/model/indi_prof/booking/get_booked_order/get_booked_order.dart';
import '../../../model/indi_prof/booking/booking_del_status/booking_del_status.dart';
import '../../../utils/images.dart';

abstract class BookingRepository {
  Future<GetBookedOrder?> getbookedOrder();

  Future<GetBookingDelStatus?> getBookingDelStatus();
}

class BookingRepositoryV1 extends BookingRepository {
  final List<BookedProduct> _onBookProductList = [
    const BookedProduct(
      id: "1",
      name: "Apple iPhone 12 Pro Max",
      thumbnail: AppImg.homelist,
      desc: "Apple iPhone 12 Pro Max (128GB) - Pacific Blue",
      delivery_location: "B-1/10, Sector-18, Rohini, New Delhi, Delhi",
      lat: "28.732260",
      long: "77.116130",
      price: "1,29,900",
      product_chat_id: "1",
      seller_id: "1",
      seller_name: "Mukesh Kumar",
      seller_img: AppImg.homelist,
      posted_on: "2021-08-01 12:00:00",
    )
  ];

  List<BookedProduct>? get onBookProductList => _onBookProductList;
  final List<BookingDelStatusData> _onBookingDelStatuslist = [
    const BookingDelStatusData(
        status: "Confirm",
        desc: "Order Confirmed",
        date: "2023-08-01 12:00:00",
        active_status: true),
  ];

  List<BookingDelStatusData>? get onBookingDelStatuslist =>
      _onBookingDelStatuslist;

  @override
  Future<GetBookedOrder?> getbookedOrder() async {
    return GetBookedOrder(
        success: true, message: "OK", data: _onBookProductList);
  }

  @override
  Future<GetBookingDelStatus?> getBookingDelStatus() async {
    return GetBookingDelStatus(
        success: true, message: "OK", data: _onBookingDelStatuslist);
  }
}

final bookingRepositoryProvider =
    Provider<BookingRepository>((ref) => BookingRepositoryV1());
