import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/business_prof/product_details/product_details_repo.dart';
import '../../../model/business_prof/product_details/get_product_details/get_product_details.dart';

abstract class ProductDetailService {
  Future<ProductDetailsResponse?> getProductDetails();
}

class ProductDetailServiceV1 implements ProductDetailService {
  ProductDetailServiceV1(
    this.productDetailsRepository,
  );

  final ProductDetailsRepository productDetailsRepository;

  @override
  Future<ProductDetailsResponse?> getProductDetails() async {
    return await productDetailsRepository.getProductDetails();
  }
}

final productDetailServiceProvider =
    Provider.autoDispose<ProductDetailService>((ref) {
  final service = ProductDetailServiceV1(
    ref.watch(productDetailsRepositoryProvider),
  );
  return service;
});
