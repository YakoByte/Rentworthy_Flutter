import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/review/review_repo.dart';
import '../../../model/indi_prof/review/get_review/get_review.dart';

abstract class ReviewService {
  Future<Map<String, dynamic>?> userGetProductReview({
    required String authtoken,    required String productId,
    required String userId,
  });
  Future<Map<String, dynamic>?> userCreateProductReview({
    required String productId,
    required String userId,
    required String review,

    required String authtoken,



  });
}

class ReviewServiceV1 implements ReviewService {
  ReviewServiceV1(this.reviewRepository,);

  final ReviewRepository reviewRepository;

  @override
  Future<Map<String, dynamic>?> userCreateProductReview({
    required String productId,
    required String userId,
    required String review,

    required String authtoken,


  }) async {
    return await reviewRepository.userCreateProductReview(productId: productId,
        userId: userId,
        review: review,
        authtoken: authtoken);
  }

  Future<Map<String, dynamic>?> userGetProductReview({
    required String authtoken, required String productId,
    required String userId,
  }) async {
    return await reviewRepository.userGetProductReview(
        authtoken: authtoken, productId: productId, userId: userId);
  }
}
final reviewServiceProvider = Provider.autoDispose<ReviewService>((ref) {
  final service = ReviewServiceV1(
    ref.watch(reviewRepositoryProvider),
  );
  return service;
});
