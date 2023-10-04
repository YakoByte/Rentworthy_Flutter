import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../application/g_map/g_map_service.dart';
import '../../../data/shared_pref/shared_pref.dart';
import '../../../model/g_map/g_map.dart';
import '../../../utils/globals.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import '../onboarding/onboarding_screen.dart';
import '../register/register_screen.dart';

part 'g_map_controller.g.dart';

@riverpod
class GMapController extends _$GMapController {
  late GoogleMapController mapController;
  GMapResponse? gMapResponse;
  final Map<String, Marker> _markers = {};
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  Map<String, Marker> get markers => _markers;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    addCustomIcon();
    onMapCreated1(mapController);
    state = const AsyncValue.data(null);
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void addCustomIcon() {
    state = const AsyncLoading();
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), AppImg.icon_location)
        .then(
      (icon) {
        markerIcon = icon;
      },
    );
    state = const AsyncValue.data(null);
  }

  Future<void> onMapCreated1(GoogleMapController controller) async {
    GMapResponse? googleOffices =
        await ref.read(gMapServiceProvider).getmapData();

    print("huyu $googleOffices");

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
