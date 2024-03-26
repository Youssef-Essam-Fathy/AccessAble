// import 'dart:html';
//
// import 'package:accessable/presentation/color_manager.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
//
// class NetworkController extends GetxController {
//   final Connectivity _connectivity = Connectivity();
//
//   @override
//   void onInit() {
//     super.onInit();
//     _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
//   }
//
//   void _updateConnectionStatus(ConnectivityResult result) {
//     Get.rawSnackbar(
//       messageText: const Text(
//         'Please connect to the internet',
//         style: TextStyle(
//             color: Colors.white,
//             fontSize: 16.0
//         ),
//       ),
//       isDismissible: false,
//       duration: const Duration(days: 1),
//       backgroundColor: ColorManager.red400,
//       icon: const Icon(
//         Icons.wifi_off,
//         color: Colors.white,
//       ),
//     );
//   }
// }