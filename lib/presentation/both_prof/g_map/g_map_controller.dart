import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/g_map/g_map_service.dart';
import '../../../model/g_map/g_map.dart';
import '../../../utils/import_utils.dart';

part 'g_map_controller.g.dart';

@riverpod
class GMapController extends _$GMapController {
  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    addCustomIcon();
    onMapCreated(mapController);
    state = const AsyncValue.data(null);
  }

  /// Add custom icon to the map
  void addCustomIcon() {
    state = const AsyncLoading();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), AppImg.iconLocation)
        .then(
      (icon) {
        markerIcon = icon;
      },
    );
    state = const AsyncValue.data(null);
  }

// void onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }
  /// Add markers to the map
  Future<void> onMapCreated(GoogleMapController controller) async {
    GMapResponse? googleOffices =
        await ref.read(gMapServiceProvider).getMapData();

    // debugPrint("huyu $googleOffices");

    _markers.clear();
    for (final office in googleOffices!.offices!) {
      final marker = Marker(
        icon: markerIcon,
        markerId: MarkerId(office.name),
        position: LatLng(office.lat, office.lng),
        infoWindow: InfoWindow(
          title: office.name,
        ),
      );
      _markers[office.name] = marker;
    }
  }
}
