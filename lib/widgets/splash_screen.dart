import 'package:aiidar_restaurant_app/app_module/Authantication/Views/main_auth_screen.dart';
import 'package:aiidar_restaurant_app/app_module/onbaording_screen/Screens/onboarding.dart';
import 'package:aiidar_restaurant_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app_module/Dashboard/dash_board.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  DateTime? trialEndDate;
  bool? isTrialExpired;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller!);

    Future.delayed(const Duration(seconds: 3), () {
      if (GetStorage().read('userID') == null) {
        Get.offAll(const OnBoardingScreen());
      } else {
        Get.offAll(const DashBoardScreen());
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: AnimatedBuilder(
              animation: _controller!,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation!.value,
                  child: Image.asset(
                    AppImages.appLogo,
                    scale: 5,
                  ),
                );
              },
            ),
            ),
        );
    }
}