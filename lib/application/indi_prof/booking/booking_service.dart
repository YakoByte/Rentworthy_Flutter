import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/booking/booking_repo.dart';
import '../../../model/indi_prof/booking/booking_del_status/booking_del_status.dart';
import '../../../model/indi_prof/booking/get_booked_order/get_booked_order.dart';

abstract class BookingService {
  @override
  Future<GetBookedOrder?> getbookedOrder();

  Future<GetBookingDelStatus?> getBookingDelStatus();
}

class BookingServiceV1 implements BookingService {
  BookingServiceV1(
    this.bookingRepository,
  );

  final BookingRepository bookingRepository;

  @override
  Future<GetBookedOrder?> getbookedOrder() async {
    return await bookingRepository.getbookedOrder();
  }

  @override
  Future<GetBookingDelStatus?> getBookingDelStatus() async {
    return await bookingRepository.getBookingDelStatus();
  }
}

final bookingServiceProvider = Provider.autoDispose<BookingService>((ref) {
  final service = BookingServiceV1(
    ref.watch(bookingRepositoryProvider),
  );
  return service;
});
