// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../presentation/business_prof/admin_panel/admin_panel.dart';
import '../../../presentation/indi_prof/bottombar/bottom_bar.dart';
import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';
import '../shared_pref/shared_pref.dart';

abstract class LoginRepository {
  Future<void> sendOTP({
    required String phoneNumber,
    PhoneMultiFactorInfo? multiFactorInfo,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    @visibleForTesting String? autoRetrievedSmsCodeForTesting,
    Duration timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    MultiFactorSession? multiFactorSession,
  });

  Future<void> verifyOTP(
      {required String verificationId, required String smsCode});

  Future<Map<String, dynamic>?> loginWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNo,
  });

  Future<User?> loginWithGoogle({required int index});

  Future<User?> logoutWithGoogle();

  Future<UserCredential?> signInWithApple({required int index});

  Future<UserCredential?> signInWithFacebook();

  Future<UserCredential?> signOutWithFacebook();
}

class LoginRepositoryV1 extends LoginRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  LoginRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<void> sendOTP({
    required String phoneNumber,
    PhoneMultiFactorInfo? multiFactorInfo,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    @visibleForTesting String? autoRetrievedSmsCodeForTesting,
    Duration timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    MultiFactorSession? multiFactorSession,
  }) {
    assert(
      phoneNumber != null || multiFactorInfo != null,
      'Either phoneNumber or multiFactorInfo must be provided.',
    );
    return auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      multiFactorInfo: multiFactorInfo,
      timeout: timeout,
      forceResendingToken: forceResendingToken,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      // ignore: invalid_use_of_visible_for_testing_member
      autoRetrievedSmsCodeForTesting: autoRetrievedSmsCodeForTesting,
      multiFactorSession: multiFactorSession,
    );
  }

  @override
  Future<void> verifyOTP(
      {required String verificationId, required String smsCode}) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final UserCredential user = await auth.signInWithCredential(credential);
      final User currentUser = auth.currentUser!;
      assert(user.user!.uid == currentUser.uid);
      // debugPrint('user0711 $user');
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red..withOpacity(0.7),
          textclr: AppColors.white);
    }
  }

  @override
  Future<Map<String, dynamic>?> loginWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNo,
  }) async {
    try {
      final body = {
        if (email != "") 'email': email,
        'password': password,
        if (phoneNo != "") "phoneNo": phoneNo
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.userLogin),
        body: body,
        headers: api.createHeaders(authtoken: "", sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['id'] != null) {
            PreferenceManagerUtils.setToken(jsonMap['token']);
            PreferenceManagerUtils.setUserId(jsonMap['id']);
            DialogServiceV1().showSnackBar(
                content: "User Logged-in Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      // throw _determineError(e);
      // debugPrint("eeeee $e ");

      return null;
    }
  }

  @override
  Future<User?> loginWithGoogle({required int index}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result = await auth.signInWithCredential(authCredential);

      User? user = result.user;

      // debugPrint('userdata $user');

      // log(" =============: RES123 :=============  ${googleSignInAuthentication.accessToken}");

      // log(" =============: RES123ger :=============  ${googleSignInAuthentication.idToken}");

      // debugPrint('userdatatoken  ${googleSignInAuthentication.accessToken}');

      if (result != null) {
        DialogServiceV1().showSnackBar(
            content: "User Logged-in Successfully!!",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);

        PreferenceManagerUtils.setIsLogin(true);

        PreferenceManagerUtils.setIsIndividual(index == 0 ? 1 : 2);

        Navigator.pushAndRemoveUntil(
            Globals.navigatorKey.currentContext!,
            PageTransition(
                child: index == 0 ? BottomBar(index: 0) : const AdminPanel(),
                type: PageTransitionType.rightToLeftWithFade,
                duration: const Duration(milliseconds: 400)),
            (Route<dynamic> route) => false);
        return user;
      } else {
        DialogServiceV1().showSnackBar(
            content: "User Logged-in Failed!!",
            color: AppColors.red..withOpacity(0.7),
            textclr: AppColors.white);

        return null;
      }
    }

    return null;
  }

  @override
  Future<User?> logoutWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    await googleSignIn.signOut();
    return null;
  }

  Future<UserCredential?> signInWithApple({required int index}) async {
    try {
      // debugPrint('signInWithApple');

      final AuthorizationResult appleResult =
          await TheAppleSignIn.performRequests([
        AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
      ]);
      // debugPrint('appleResult  $appleResult');

      if (appleResult.error != null) {
        // debugPrint('appleResult.error  ${appleResult.error}');
        // handle errors from Apple here
      }

      final AuthCredential credential = OAuthProvider('apple.com').credential(
        accessToken: appleResult.credential!.authorizationCode.toString(),
        idToken: appleResult.credential!.identityToken.toString(),
      );
      // debugPrint('appleResult  credential $credential');

      UserCredential userCredential =
          await auth.signInWithCredential(credential);
      //  debugPrint('appleResult  userCredential $userCredential');

      User user = userCredential.user!;
      // debugPrint('appleResult  userCredential user $user');

      if (userCredential.user != null) {
        //debugPrint('User Logged-in Successfully!!');

        DialogServiceV1().showSnackBar(
            content: "User Logged-in Successfully!!",
            color: AppColors.colorPrimary.withOpacity(0.7),
            textclr: AppColors.white);

        PreferenceManagerUtils.setIsLogin(true);

        PreferenceManagerUtils.setIsIndividual(index == 0 ? 1 : 2);

        Navigator.pushAndRemoveUntil(
            Globals.navigatorKey.currentContext!,
            PageTransition(
                child: index == 0 ? BottomBar(index: 0) : const AdminPanel(),
                type: PageTransitionType.rightToLeftWithFade,
                duration: const Duration(milliseconds: 400)),
            (Route<dynamic> route) => false);
        return userCredential;
      } else {
        //  debugPrint('signInWithApple  User Logged-in Failed!!');

        DialogServiceV1().showSnackBar(
            content: "User Logged-in Failed!!",
            color: AppColors.red..withOpacity(0.7),
            textclr: AppColors.white);

        return null;
      }
    } catch (error) {
      //   print(" catch error $error");
      return null;
    }
  }

  @override
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email'],
      loginBehavior: LoginBehavior.webOnly,
    );
    User user;
    if (result.status == LoginStatus.success) {
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return null;
  }

  @override
  Future<UserCredential?> signOutWithFacebook() async {
    await FacebookAuth.instance.logOut();
    return null;
  }
// @override
// Future<UserCredential?> signInWithApple({required int index}) async {
//   try {
//     debugPrint('signInWithApple  1');
//
//     final appleProvider = AppleAuthProvider();
//     debugPrint('appleProvider  $appleProvider');
//     UserCredential userCredential =
//         await FirebaseAuth.instance.signInWithProvider(appleProvider);
//     debugPrint('signInWithApple  userCredential $userCredential');
//     if (userCredential.user != null) {
//       DialogServiceV1().showSnackBar(
//           content: "User Logged-in Successfully!!",
//           color: AppColors.colorPrimary.withOpacity(0.7),
//           textclr: AppColors.white);
//
//       PreferenceManagerUtils.setIsLogin(true);
//
//       PreferenceManagerUtils.setIsIndividual(index == 0 ? 1 : 2);
//
//       Navigator.pushAndRemoveUntil(
//           Globals.navigatorKey.currentContext!,
//           PageTransition(
//               child: index == 0 ? BottomBar(index: 0) : const AdminPanel(),
//               type: PageTransitionType.rightToLeftWithFade,
//               duration: const Duration(milliseconds: 400)),
//           (Route<dynamic> route) => false);
//       return userCredential;
//     } else {
//       debugPrint('signInWithApple  User Logged-in Failed!!');
//
//       DialogServiceV1().showSnackBar(
//           content: "User Logged-in Failed!!",
//           color: AppColors.red..withOpacity(0.7),
//           textclr: AppColors.white);
//
//       return null;
//     }
//   } catch (e) {
//     // throw _determineError(e);
//     debugPrint("catch eeeee $e ");
//
//     return null;
//   }
// }
}

final loginRepositoryProvider =
    Provider<LoginRepository>((ref) => LoginRepositoryV1(ApiClient()));
