import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_booked_order.freezed.dart';

part 'get_booked_order.g.dart';

@freezed
abstract class GetBookedOrder with _$GetBookedOrder {
  const factory GetBookedOrder({
    required bool? success,
    required String? message,
    required List<BookedProduct>? data,
  }) = _GetBookedOrder;

  factory GetBookedOrder.fromJson(Map<String, dynamic> json) =>
      _$GetBookedOrderFromJson(json);
}

@freezed
abstract class BookedProduct with _$BookedProduct {
  const factory BookedProduct({
    required String? id,
    required String? name,
    required String? thumbnail,
    required String? desc,
    required String? delivery_location,
    required String? lat,
    required String? long,
    required String? price,
    required String? product_chat_id,
    required String? seller_id,
    required String? seller_name,
    required String? seller_img,
    required String? posted_on,
  }) = _BookedProduct;

  factory BookedProduct.fromJson(Map<String, dynamic> json) =>
      _$BookedProductFromJson(json);
}
