import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'g_map_controller.dart';

class GoogleMapWidget extends ConsumerWidget {
  BorderRadiusGeometry borderRadius;

  GoogleMapWidget({super.key, required this.borderRadius});

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
        borderRadius: borderRadius,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: GoogleMap(
          onMapCreated: controller().onMapCreated,

          initialCameraPosition: const CameraPosition(
            target: LatLng(41.8781, -87.623177),
            zoom: 15.0,
          ),

          // markers: controller().markers.values.toSet(),
        ),
      ),
    );
  }
}
