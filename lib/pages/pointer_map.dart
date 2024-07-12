// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:map_flutter_yandex/models/pointer_model.dart';
// import 'package:map_flutter_yandex/service/dio_service.dart';
// import 'package:yandex_mapkit/yandex_mapkit.dart';

// class PointerMapPage extends StatefulWidget {
//   const PointerMapPage({super.key});

//   @override
//   State<PointerMapPage> createState() => _PointerMapPageState();
// }

// class _PointerMapPageState extends State<PointerMapPage> {
//   ///properties
//   bool isLoading = true;
//   static String apiPoiter = '/mapPointer';
//   List<MapPointer> pointerMap = [];
//   late Position myPosition;
//   late YandexMapController yandexMapController;

//   ///method
//   Future<void> read() async {
//     isLoading = false;
//     String? result = await DioService.getData(context, apiPoiter);
//     if (result != null) {
//       log('oqidi');
//       isLoading = true;
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     read();
//     super.initState();
//   }

//   void onMapCreated(YandexMapController controller) {
//     yandexMapController = controller;
//     yandexMapController.moveCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: Point(
//               latitude: myPosition.latitude, longitude: myPosition.longitude),
//           zoom: 18,
//           tilt: 900,
//           azimuth: 180,
//         ),
//       ),
//     );
//   }

//   void findMe() {
//     yandexMapController.moveCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: Point(
//               latitude: myPosition.latitude, longitude: myPosition.longitude),
//           zoom: 18,
//           tilt: 50,
//           azimuth: 180,
//         ),
//       ),
//       animation: const MapAnimation(type: MapAnimationType.linear, duration: 2),
//     );

//     yandexMapController.moveCamera(
//         CameraUpdate.newCameraPosition(
//           CameraPosition(
//               target: Point(
//                   latitude: myPosition.latitude,
//                   longitude: myPosition.longitude),
//               zoom: 19,
//               tilt: 90,
//               azimuth: 180),
//         ),
//         animation:
//             const MapAnimation(type: MapAnimationType.linear, duration: 4));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isLoading
//         ? Scaffold(
//             body: YandexMap(
//               onMapCreated: onMapCreated,
//             ),
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 findMe();
//               },
//               child: const Icon(Icons.gps_fixed_rounded),
//             ),
//           )
//         : const Center(child: CircularProgressIndicator());
//   }
// }
