import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rent_now_screen_controller.g.dart';

final kApiUrl = defaultTargetPlatform == TargetPlatform.android
    ? 'http://10.0.2.2:4242'
    : 'http://localhost:4242';

@riverpod
class RentNowController extends _$RentNowController {
  Map<String, dynamic>? paymentIntentData;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    _isLoading = true;
    // initPaymentSheet();
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      state = const AsyncValue.data(null);
    });

    state = const AsyncValue.data(null);
  }

  ///create payment intent
  Future<void> makePayment() async {
    try {
      paymentIntentData =
          await createPaymentIntent('20', 'USD'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
            setupIntentClientSecret:
                'sk_test_51MFuOjSBUkFSnwGbIKmJDVAFVuFYFXJkCZi1NdaOtHF9z1IQPyON9LjIoHeVA4CvRwqI83PQqCRiDaopV3Jyz20800UYcjAtTL',
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            style: ThemeMode.dark,
            merchantDisplayName: 'ASIF',
            googlePay: const PaymentSheetGooglePay(
              merchantCountryCode: "US",
              currencyCode: "USD",
              amount: "20",
              testEnv: true,
            ),
            customFlow: true,
          ))
          .then((value) {});

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      // print('Payment exception:$e$s');
    }
  }

  ///display payment sheet
  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        // print('payment intent${paymentIntentData!['id']}');
        // print('payment intent${paymentIntentData!['client_secret']}');
        // print('payment intent${paymentIntentData!['20']}');
        // print('payment intent$paymentIntentData');
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(Globals.navigatorKey.currentContext!).showSnackBar(
            const SnackBar(content: Text("Payment Successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        // print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on StripeException catch (e) {
      // print('Exception/DISPLAYPAYMENTSHEET1==> $e');
      showDialog(
          context: Globals.navigatorKey.currentContext!,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      // print('$e');
    }
  }

  ///create payment intent
  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount('20'),
        'currency': currency,
      };
      // print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51MFuOjSBUkFSnwGbIKmJDVAFVuFYFXJkCZi1NdaOtHF9z1IQPyON9LjIoHeVA4CvRwqI83PQqCRiDaopV3Jyz20800UYcjAtTL',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      // log('Create Intent response ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // print('err charging user: ${err.toString()}');
    }
  }

  ///calculate amount
  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
