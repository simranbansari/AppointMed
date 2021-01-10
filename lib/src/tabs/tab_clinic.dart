import 'dart:collection';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';

import '../appointment_table.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../constants.dart';
import '../navigation.dart';
import 'package:location/location.dart';
import '../navigation.dart';

import 'tab_schedule.dart';
import 'tab_booked_appointments.dart';

class HomeTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeTabState();
  }
}

class HomeTabState extends State<HomeTab> {
  GoogleMapController mapController;
  bool mapViewEnabled = false;

  final LatLng _center = const LatLng(43.653225, -79.383186);
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return mapView();
  }

  Widget mapView() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 13,
      ),
    );
  }
}
