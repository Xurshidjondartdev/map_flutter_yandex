// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:map_flutter_yandex/models/pointer_model.dart';
// import 'package:map_flutter_yandex/service/dio_service.dart';
// import 'package:map_flutter_yandex/service/util_service.dart';

// class CustomFlutterMap extends StatefulWidget {
//   const CustomFlutterMap({super.key});

//   @override
//   State<CustomFlutterMap> createState() => _CustomFlutterMapState();
// }

// class _CustomFlutterMapState extends State<CustomFlutterMap> {
//   ///properties
//   late Position myPosition;
//   bool isLoading = false;
//   List<MapPointer> pointerMap = [];
//   static String apiPoiter = '/mapPointer';

//   ///methods
//   @override
//   void initState() {
//     super.initState();
//     _determinePosition().then((value) {
//       isLoading = true;
//       read();
//       setState(() {});
//     });
//   }

//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled.');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     myPosition = await Geolocator.getCurrentPosition();
//     isLoading = true;
//     setState(() {});
//     return myPosition;
//   }

//   Future<void> read() async {
//     isLoading = false;
//     String? result = await DioService.getData(context, apiPoiter);
//     if (result != null) {
//       Utils.fireSnackBar('Siz belgilagan joylashuv', context);
//       log('oqidi');
//       pointerMap = listMapPointerFromJson(result);
//       isLoading = true;
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           isLoading
//               ? FlutterMap(
//                   options: MapOptions(
//                     initialCenter: LatLng(
//                       myPosition.latitude,
//                       myPosition.longitude,
//                     ),
//                     initialZoom: 14,
//                   ),
//                   children: [
//                     TileLayer(
//                       urlTemplate:
//                           'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                     ),
//                     // PolygonLayer(
//                     //   polygonCulling: false,
//                     //   polygons: [
//                     //     Polygon(
//                     //         points: const [
//                     //           LatLng(41.329143, 69.227080),
//                     //           LatLng(41.326791, 69.231758),
//                     //           LatLng(41.324470, 69.227381),
//                     //           LatLng(41.326275, 69.223261),
//                     //         ],
//                     //         color: Colors.blue.withOpacity(0.5),
//                     //         borderStrokeWidth: 2,
//                     //         borderColor: Colors.blue,
//                     //         isFilled: true,
//                     //     ),
//                     //   ],
//                     // ),
//                     // PolylineLayer(
//                     //   polylines: [
//                     //     Polyline(
//                     //       points: const [
//                     //         LatLng(41.329433, 69.218840),
//                     //         LatLng(41.321825, 69.217359),
//                     //         LatLng(41.324932, 69.236029),
//                     //         LatLng(41.329433, 69.218840),
//                     //       ],
//                     //       color: Colors.blue,
//                     //       strokeWidth: 2,
//                     //     ),
//                     //   ],
//                     // ),
//                     // CircleLayer(
//                     //   circles: [
//                     //     CircleMarker(
//                     //       point: const LatLng(41.326506, 69.220846),
//                     //       radius: 100,
//                     //       useRadiusInMeter: true,
//                     //       color: Colors.red.withOpacity(0.3),
//                     //       borderColor: Colors.red.withOpacity(0.7),
//                     //       borderStrokeWidth: 2,
//                     //     )
//                     //   ],
//                     // ),
//                     MarkerLayer(
//                       markers: [
//                         Marker(
//                             point: LatLng(
//                               pointerMap.last.lang.toDouble(),
//                               pointerMap.last.long.toDouble(),
//                             ),
//                             width: 80,
//                             height: 80,
//                             child: const Icon(
//                               Icons.place,
//                               color: Colors.red,
//                               size: 55,
//                             )),
//                       ],
//                     )
//                   ],
//                 )
//               : const Center(
//                   child: CircularProgressIndicator(),
//                 )
//         ],
//       ),
//     );
//   }
// }
