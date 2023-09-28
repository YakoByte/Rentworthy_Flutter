import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentworthy/presentation/both_prof/loading/loading_screen.dart';
import 'package:rentworthy/presentation/business_prof/admin_panel/admin_panel.dart';
import 'package:rentworthy/presentation/business_prof/business_category_details/business_category_details_screen.dart';
import 'package:rentworthy/presentation/business_prof/track_item/track_item_screen.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:rentworthy/utils/state_logger.dart';
import 'package:rentworthy/utils/text.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
    DevicePreview(
      enabled: kIsWeb,
      builder: (context) => (const ProviderScope(
          observers: [StateLogger()], child: MyApp())), // Wrap your app
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
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      navigatorKey: Globals.navigatorKey,
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      title: AppText.app_name,
      useInheritedMediaQuery: true,
      theme: ThemeData(
          fontFamily: GoogleFonts.ptSans().fontFamily, useMaterial3: true),
      // home: CategoryDetailsScreen(title: "Xbox"),
      home: const LoadingScreen(),
      // home: AdminPanel(),
      // home: TrackItem(),
      // home: LoginPhoneScreen(),
      // home: ProductAvailabliity(),
      // home: AccountVerification(
      //   email: 'm@gmail.com',
      // ),
      // home: DetectOtp(
      //   phoneNo: '+918585858585',
      // ),
      // home: const FindLocation(),
      // home: CategoryDetailsScreen(
      //   title: 'sdf',
      // ),
      // home: BottomBar(index: 0),
      // home: PostUrAds(
      //   type: 'Music',
      // ),
      // home: LoadingScreen(),
      // home: AddAddressScreen(),
      // home: MyHomePage(),
      // home: ViewAllCategory(
      //   title: 'df',
      // ),
    );
  }
}
