// // import 'package:flutter/material.dart';
// // // ignore: unnecessary_import
// // import 'package:flutter/widgets.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:get/get.dart';
// // import 'package:tribe_event/screens/authentication/welcome/welcome_screen.dart';
// // import 'package:tribe_event/screens/user/artist_screen/artist_detail_screen.dart';
// // import 'package:tribe_event/utils/app_color.dart';
// // import 'package:tribe_event/utils/app_images.dart';
// // import 'package:tribe_event/widgets/custom_text.dart';
//
// // class OnbaordingScreen1 extends StatefulWidget {
// //   const OnbaordingScreen1({super.key});
//
// //   @override
// //   State<OnbaordingScreen1> createState() => _OnbaordingScreen1State();
// // }
//
// // class _OnbaordingScreen1State extends State<OnbaordingScreen1> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Container(
// //       height: double.infinity,
// //       width: double.infinity,
// //       decoration: const BoxDecoration(
// //         image: DecorationImage(
// //             image: AssetImage(AppImaes.OnbaordingImage1), fit: BoxFit.cover),
// //       ),
// //       child: Padding(
// //         padding: EdgeInsets.only(top: 547.h, right: 45.w, left: 45.w),
// //         child: Column(
// //           children: [
// //             CText(
// //               text: 'Electronic Music',
// //               fontSize: 20,
// //               color: AppColors.whiteColor,
// //               fontWeight: FontWeight.w600,
// //             ),
// //             Container(
// //               // width: 300.w,
// //               child: CText(
// //                 text:
// //                     r'Lorem lpsum is simply dummy text of printing and typesetting industry. Lorem lpsum ',
// //                 fontSize: 16,
// //                 softWrap: true,
// //                 fontWeight: FontWeight.w400,
// //                 ellipsisText: true,
// //               ),
// //             ),
// //             TextButton(
// //               onPressed: () {
// //                 Get.to(const ArtistDetails());
// //               },
// //               child: const Text('Next'),
// //             )
// //           ],
// //         ),
// //       ),
// //     ));
// //   }
// // }
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tribe_event/screens/authentication/welcome/welcome_screen.dart';
// import 'package:tribe_event/utils/app_color.dart';
// import 'package:tribe_event/utils/app_images.dart';
// import 'package:tribe_event/widgets/custom_text.dart';
// import 'package:tribe_event/widgets/primary_button.dart';
//
// class OnbaordingScreen1 extends StatelessWidget {
//
//   const OnbaordingScreen1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       extendBody: true,
//       extendBodyBehindAppBar: true,
//       body: OnBoardingSlider(
//         addButton: false,
//         centerBackground: true,
//         //
//         totalPage: 3,
//
//         pageBackgroundColor: AppColors.deepindigoColor,
//         background: [
//           Image.asset(
//             AppImaes.OnbaordingImage1,
//           ),
//           Image.asset(
//             AppImaes.popmusic,
//             fit: BoxFit.cover,
//           ),
//           Image.asset(
//             AppImaes.jazzmusic,
//             fit: BoxFit.cover,
//           ),
//         ],
//         speed: 1.8,
//         headerBackgroundColor: Colors.transparent,
//         controllerColor: AppColors.whiteColor,
//         pageBodies: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: <Widget>[
//               SizedBox(
//                 height: 260.h,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height / 2,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.4),
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: const [
//                       0.2,
//                       0.6,
//                     ],
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 45.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 100.h,
//                       ),
//                       CText(
//                         text: 'Electronic Music',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.whiteColor,
//                       ),
//                       SizedBox(
//                         height: 16.h,
//                       ),
//                       CText(
//                         text:
//                             'Lorem lpsum is simply dummy text of printing and typesetting industry. Lorem lpsum',
//                         fontSize: 16,
//                         softWrap: true,
//                         ellipsisText: true,
//                         maxLines: 3,
//                         alignText: TextAlign.center,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.whiteColor,
//                       ),
//                       IntroButton(onPressed: () {}),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 260.h,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height / 2,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.2),
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: const [
//                       0.2,
//                       0.6,
//                     ],
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 45.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 91.h,
//                       ),
//                       CText(
//                         text: 'Pop Music',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.whiteColor,
//                       ),
//                       SizedBox(
//                         height: 16.h,
//                       ),
//                       CText(
//                         text:
//                             'Lorem lpsum is simply dummy text of printing and typesetting industry. Lorem lpsum',
//                         fontSize: 16,
//                         softWrap: true,
//                         ellipsisText: true,
//                         maxLines: 3,
//                         alignText: TextAlign.center,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.whiteColor,
//                       ),
//                       IntroButton(onPressed: () {}),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 280.h,
//               ),
//               Container(
//                 height: MediaQuery.of(context).size.height / 2,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.transparent,
//                       Colors.black.withOpacity(0.5),
//                     ],
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     stops: const [
//                       0.2,
//                       0.6,
//                     ],
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 45.w),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 100.h,
//                       ),
//                       CText(
//                         text: 'Jazz Music',
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.whiteColor,
//                       ),
//                       SizedBox(
//                         height: 16.h,
//                       ),
//                       CText(
//                         text:
//                             'Lorem lpsum is simply dummy text of printing and typesetting industry. Lorem lpsum',
//                         fontSize: 16,
//                         softWrap: true,
//                         ellipsisText: true,
//                         maxLines: 3,
//                         alignText: TextAlign.center,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.whiteColor,
//                       ),
//                       IntroButton(onPressed: () {
//                         Navigator.push(
//                           context,
//                           CupertinoPageRoute(
//                             builder: (context) =>const WelcomeScreen(),
//                           ),
//                         );
//                       }),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
