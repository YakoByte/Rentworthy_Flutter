import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentworthy/presentation/both_prof/loading/loading_screen.dart';
import 'firebase_options.dart';
import 'utils/import_utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Portrait mode only
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  /// Stripe initialization with publishable key

  Stripe.publishableKey =
      "pk_test_51MFuOjSBUkFSnwGb1QwnmOqm6M1toMv3hqXdxqgGbH2OfY9zg0wms9IwCV1MghsOmZa8ZkIUhgPyi4bliHMZl8gv00Sp0piMJX";

  /// Stripe initialization with stripe options
  await Stripe.instance.applySettings();

  /// Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///Native Splash screen initialization
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Run app
  runApp(
    /// Device preview for all devices
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => (

          /// ProviderScope for state management
          const ProviderScope(observers: [StateLogger()], child: MyApp())),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    initialization();
  }

  void initialization() async {
    Timer(const Duration(seconds: 2), () {
      /// Remove splash screen
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      navigatorKey: Globals.navigatorKey,

      /// Navigator key for global navigation
      debugShowCheckedModeBanner: false,

      /// Remove debug banner
      builder: DevicePreview.appBuilder,

      /// Device preview builder
      title: AppText.appName,

      /// App name
      useInheritedMediaQuery: true,

      /// Use inherited media query
      /// Theme data
      theme: ThemeData(
          fontFamily: GoogleFonts.ptSans().fontFamily, useMaterial3: true),

      home: const LoadingScreen(),
    );
  }
}
