import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapTesting extends StatefulWidget {
  const MapTesting({super.key});

  @override
  State<MapTesting> createState() => _MapTestingState();
}

class AppConstants {
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA';

  static const String mapBoxStyleId = 'cljieeo5b002d01o40q7fdqs1';

  static final myLocation = LatLng(21.250000, 81.629997);
}

class MapMarker {
  final LatLng? location;

  MapMarker({
    required this.location,
  });
}

final mapMarkers = [
  MapMarker(
    location: LatLng(21.2441408, 81.6319132),
  ),
  MapMarker(
    location: LatLng(21.2441417, 81.6290905),
  ),
  MapMarker(
    location: LatLng(21.2448292, 81.6403591),
  ),
];

class _MapTestingState extends State<MapTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                minZoom: 5,
                maxZoom: 18,
                zoom: 13,
                center: AppConstants.myLocation),
            children: [
              TileLayer(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/harshu0711/cljieeo5b002d01o40q7fdqs1/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaGFyc2h1MDcxMSIsImEiOiJjbGppZHpsbXYwbWFtM3BvNWd1eDZ3a210In0.zj_4e5MiDhPqzk1bALR4zA",
              ),
              MarkerLayer(
                markers: [
                  Marker(
                      point: LatLng(21.2441408, 81.6319132),
                      builder: (_) {
                        return GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/logo.png',
                            ));
                      }),
                  Marker(
                      point: LatLng(21.2441417, 81.6290905),
                      builder: (_) {
                        return GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/cabIcon.png',
                            ));
                      }),
                  Marker(
                      point: LatLng(21.2448292, 81.6403591),
                      builder: (_) {
                        return GestureDetector(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/cabIcon.png',
                            ));
                      }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
