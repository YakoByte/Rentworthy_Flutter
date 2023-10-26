import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/review/review_repo.dart';
import '../../../model/indi_prof/review/get_review/get_review.dart';

abstract class ReviewService {
  Future<GetReview?> getReviewData();
}

class ReviewServiceV1 implements ReviewService {
  ReviewServiceV1(
    this.reviewRepository,
  );

  final ReviewRepository reviewRepository;

  @override
  Future<GetReview?> getReviewData() async {
    return await reviewRepository.getReviewData();
  }
}

final reviewServiceProvider = Provider.autoDispose<ReviewService>((ref) {
  final service = ReviewServiceV1(
    ref.watch(reviewRepositoryProvider),
  );
  return service;
});
