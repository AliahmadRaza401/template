import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_color.dart';

// class AppMessage {
//   static void show(String message, bool error) {
//     BotToast.showCustomText(
//       toastBuilder: (_) {
//         return Container(
//           margin: const EdgeInsets.symmetric(horizontal: 16),
//           child: Material(
//             borderRadius: BorderRadius.circular(8),
//             color: Theme.of(Get.context!).colorScheme.onSecondary,
//             elevation: 2,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
//               child: Text(
//                 message,
//                 style: Theme.of(Get.context!).textTheme.bodyMedium,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

appToast(String message){
  Get.snackbar('',message );
}

Widget appLoader({Color? color}){
  return  Center(child: CircularProgressIndicator(color:color?? AppColors.primaryColor));
}