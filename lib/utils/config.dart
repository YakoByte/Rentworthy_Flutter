class ApiConfig {
  ApiConfig._();

  static const String scheme = "https://";
  static const String host = "backend.rentworthy.us";
  static const String basePath = "/app/api/v1/";
  static const String mainUrl = scheme + host + basePath;

  // static const String mainUrl = "http://localhost:5000/web/api/v1/";
  static const String user = "user/";
  static const String admin = "admin/";
  static const String role = "role/";
  static const String renting = "renting/";
  static const String category = "category/";
  static const String product = "product/";
  static const String upload = "upload/";
  static const String social = "social/";

  /// User

  static const String userSignup = "$mainUrl${user}signup";
  static const String userSocialSignup = "$mainUrl${user}social-signup";
  static const String userLogin = "$mainUrl${user}login";
  static const String userCreateOtp = "$mainUrl${user}createOtp";
  static const String userVerifyOtp = "$mainUrl${user}verifyOtp";
  static const String userResetPassword = "$mainUrl${user}reset-password";

  /// Location

  static const String userCreateLocation = "$mainUrl${user}create-location";
  static const String userGetLocation = "$mainUrl${user}get-location?userId=";

  /// Address

  static const String userCreateAddress = "$mainUrl${user}create-address";
  static const String userGetAddress = "$mainUrl${user}get-address?userId=";
  static const String userUpdateAddress = "$mainUrl${user}update-address?_id=";
  static const String userDeleteAddress = "$mainUrl${user}delete-address?_id=";

  ///Wishlist

  static const String userAddWishlist = "$mainUrl${renting}create-wishlist";
  static const String userGetWishlist = "$mainUrl${renting}get-wishlist";
  static const String userRemoveWishlist =
      "$mainUrl${renting}remove-product-from-wishlist?_id=";

  /// Profile

  static const String userCreateProfile = "$mainUrl${user}create-profile";
  static const String userGetProfile = "$mainUrl${user}get-profile";
  static const String userUpdateProfile = "$mainUrl${user}update-profile";
  static const String userDeleteProfile = "$mainUrl${user}delete-profile";

  /// Category

  static const String userGetCategory = "$mainUrl${category}get-category?_id=";

  /// Sub Category

  static const String userGetSubCategory =
      "$mainUrl${category}get-subcategory?";

  ///Like

  static const String userCreateProductLike =
      "$mainUrl${product}create-productlike";
  static const String userGetProductLike =
      "$mainUrl${product}get-productlikes?userId=";

  ///Product

  static const String userCreateProduct = "$mainUrl${product}create-product";
  static const String userGetProduct = "$mainUrl${product}get-product";

  ///Rating

  static const String userCreateProductRating =
      "$mainUrl${product}create-productrating";
  static const String userGetProductRating =
      "$mainUrl${product}get-productrating?userId=653b3d27d7d9247e5c16fd83&productId=65426c0ba2d8e46b3b776d3a";

  ///Review

  static const String userCreateProductReview =
      "$mainUrl${product}create-productreview";
  static const String userGetProductReview =
      "$mainUrl${product}get-productreview?userId=653b3d27d7d9247e5c16fd83&productId=65426c0ba2d8e46b3b776d3a";

  ///Booking Request

  static const String userCreateBooking = "$mainUrl${renting}create-booking";

  static const String userGetBooking = "$mainUrl${renting}get-booking";
  static const String userVerifyStripeId =
      "$mainUrl${renting}verify-stripe-id/";

  ///contact us
  static const String userContactUs = "$mainUrl${social}create-contactus";
  static const String userPrivacyPolicy =
      "$mainUrl${social}get-privacyPolicy?title=aboutUs";
  static const String userTermsCondition =
      "$mainUrl${social}get-termCondition?title=aboutUs";

  ///Business

  static const String userCreateBusiness = "$mainUrl${user}create-business";
  static const String userGetBusiness =
      "$mainUrl${user}user/get-business?userId=";
}
