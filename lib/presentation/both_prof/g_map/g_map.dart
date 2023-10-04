import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'g_map_controller.dart';

class GoogleMapWidget extends ConsumerWidget {
  const GoogleMapWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(gMapControllerProvider);
    controller() => ref.read(gMapControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.2,
      width: w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: GoogleMap(
          onMapCreated: controller().onMapCreated1,
          initialCameraPosition: const CameraPosition(
            target: LatLng(52.337801, 4.872066),
            zoom: 2.0,
          ),
          markers: controller().markers.values.toSet(),
        ),
      ),
    );
  }
}
