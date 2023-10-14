import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/import_utils.dart';
import '../../../model/indi_prof/review/get_review/get_review.dart';

abstract class ReviewRepository {
  Future<GetReview?> getReviewData();
}

class ReviewRepositoryV1 extends ReviewRepository {
  final List<ReviewDetails> _onReviewDetailsList = [
    const ReviewDetails(
        user_name: "User 1",
        user_img: AppImg.homelist,
        review: "Review 1",
        rating: "5",
        review_date: "10:00 AM"),
  ];

  List<ReviewDetails>? get onReviewDetailsList => _onReviewDetailsList;

  @override
  Future<GetReview?> getReviewData() async {
    return GetReview(
        success: true,
        message: "OK",
        data: ReviewData(
            total_review: "1",
            total_review_count: "1",
            five_star: "1",
            four_star: "0",
            three_star: "0",
            two_star: "0",
            one_star: "0",
            reviews: _onReviewDetailsList));
  }
}

final reviewRepositoryProvider =
    Provider<ReviewRepository>((ref) => ReviewRepositoryV1());
