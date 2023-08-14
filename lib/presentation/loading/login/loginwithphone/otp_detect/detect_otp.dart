import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../login_phone_screen_controller.dart';

class DetectOtp extends ConsumerWidget {
  const DetectOtp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(loginPhoneScreenControllerProvider);
    controller() => ref.read(loginPhoneScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container();
  }
}
