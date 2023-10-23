// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';
import 'dart:math' as math;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../presentation/business_prof/admin_panel/admin_panel.dart';
import '../../../presentation/indi_prof/bottombar/bottom_bar.dart';
import '../../../utils/import_utils.dart';
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

  Future<User?> loginWithGoogle({required int index});

  Future<User?> logoutWithGoogle();

  Future<UserCredential?> signInWithFacebook();

  Future<UserCredential?> signoutWithFacebook();
}

class LoginRepositoryV1 extends LoginRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String?> generateOTP() async {
    math.Random random = math.Random();
    return (1000 + random.nextInt(9999)).toString();
  }

  // @override
  // Future<ConfirmationResult> sendOTP({
  //   required String countryCode,
  //   required String phone,
  // }) async {
  //   String? otp = await generateOTP();
  //   ConfirmationResult result = await auth.signInWithPhoneNumber(
  //     '${countryCode ?? '91'} $phone',
  //   );
  //   return result;
  // }

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

      // Getting users credential

      UserCredential result = await auth.signInWithCredential(authCredential);

      User? user = result.user;

      print('userdata $user');

      log(" =============: RES123 :=============  ${googleSignInAuthentication.accessToken}");

      log(" =============: RES123ger :=============  ${googleSignInAuthentication.idToken}");

      print('userdatatoken  ${googleSignInAuthentication.accessToken}');

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

  @override
  Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: ['email'],
      loginBehavior: LoginBehavior.webOnly,
    );
    User user;
    if (result.status == LoginStatus.success) {
      //Create a credential from the access token

      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      // Once signed in, return the UserCredential

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return null;
  }

  @override
  Future<UserCredential?> signoutWithFacebook() async {
    await FacebookAuth.instance.logOut();
    return null;
  }
}

final loginRepositoryProvider =
    Provider<LoginRepository>((ref) => LoginRepositoryV1());
