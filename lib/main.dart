import 'dart:async';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rentworthy/presentation/loading/loading_screen.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:rentworthy/utils/state_logger.dart';
import 'package:rentworthy/utils/text.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
    Timer(const Duration(seconds: 1), () {
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
      home: const LoadingScreen(),
    );
  }
}
