import 'package:aiidar_restaurant_app/app_module/Authantication/Views/main_auth_screen.dart';
import 'package:aiidar_restaurant_app/app_module/Dashboard/View/dash_board.dart';
import 'package:aiidar_restaurant_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
     Future.delayed(const Duration(seconds: 3),(){

       if(GetStorage().read('userID')==null){
         Get.offAll(const MainAuthScreen());
       }else{
         Get.offAll(const DashBoardScreen());
       }
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Image.asset(AppImages.appLogo,height: 60,)),);
  }
}
