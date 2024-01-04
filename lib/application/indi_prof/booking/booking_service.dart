import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/booking/booking_repo.dart';
import '../../../model/indi_prof/booking/booking_del_status/booking_del_status.dart';
import '../../../model/indi_prof/booking/get_booked_order/get_booked_order.dart';

abstract class BookingService {

}

class BookingServiceV1 implements BookingService {
  BookingServiceV1(
    this.bookingRepository,
  );

  final BookingRepository bookingRepository;


}

final bookingServiceProvider = Provider.autoDispose<BookingService>((ref) {
  final service = BookingServiceV1(
    ref.watch(bookingRepositoryProvider),
  );
  return service;
});
