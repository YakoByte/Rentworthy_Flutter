import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/business_prof/product_details/get_product_details/get_product_details.dart';
import '../../../utils/images.dart';

abstract class ProductDetailsRepository {
  Future<ProductDetailsResponse?> getProductDetails();
}

class ProductDetailsRepositoryV1 extends ProductDetailsRepository {
  final List<ProductDetailsData> _onProductDetails = [
    const ProductDetailsData(
        id: "1",
        name: "Xbox Series S",
        imgs: [
          AppImg.xbox,
          AppImg.xbox,
          AppImg.xbox,
        ],
        thumbnail: AppImg.xbox,
        desc:
            "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint. Velit officiaconsequat duis enim velit mollit.Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint. Velit officiaconsequat duis enim velit mollit.",
        location: "Kathmandu",
        time_period: "1 month",
        lat: "27.7172",
        long: "85.3240",
        link: "https://www.xbox.com/en-US/consoles/xbox-series-s",
        price: "\$5000",
        tracking_id: "87654321",
        seller_id: "1",
        seller_name: "John Doe",
        seller_img: AppImg.homelist,
        posted_on: "2021-09-01",
        isfav: true,
        total_review: "4.5",
        total_review_rating: "141 Ratings & 16 Reviews",
        five_star: "3,934",
        four_star: "334",
        three_star: "82",
        two_star: "40",
        one_star: "255",
        reviews: [
          ProductReview(
              user_name: "Hamza Ali",
              user_img: AppImg.homelist,
              review_title: "Good",
              review:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
              rating: "4.5",
              like: "51",
              dislike: "4",
              is_user_certified: true,
              user_location: "USA",
              review_date: "2021-09-01"),
          ProductReview(
              user_name: "Hamza Ali",
              user_img: AppImg.homelist,
              review_title: "Good",
              review:
                  "Exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum",
              rating: "3.5",
              like: "51",
              dislike: "4",
              is_user_certified: false,
              user_location: "USA",
              review_date: "2021-09-01"),
        ]),
  ];

  List<ProductDetailsData>? get onProductDetails => _onProductDetails;

  @override
  Future<ProductDetailsResponse?> getProductDetails() async {
    return ProductDetailsResponse(
        success: true, message: "OK", data: _onProductDetails);
  }
}

final productDetailsRepositoryProvider =
    Provider<ProductDetailsRepository>((ref) => ProductDetailsRepositoryV1());
