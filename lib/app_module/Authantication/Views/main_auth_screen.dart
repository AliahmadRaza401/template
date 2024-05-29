import 'package:aiidar_restaurant_app/app_module/Authantication/Views/signup_screen.dart';
import 'package:aiidar_restaurant_app/utils/app_images.dart';
import 'package:aiidar_restaurant_app/widgets/custom_text.dart';
import 'package:aiidar_restaurant_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'login_screen.dart';
class MainAuthScreen extends StatelessWidget {
  const MainAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Image.asset(AppImages.appLogo,width: 206.w),
              const Spacer(),
              AppText(text: 'Use Aiidar to Get Food & Delivery on your Doorstep', fontSize: 22.sp,maxLines: 2,fontWeight: FontWeight.w600,alignText: TextAlign.center,),
              SizedBox(height: 20.h,),
            PrimaryButton(text: 'Login your account', onTap: (){
              Get.to( LoginScreen());
            }),
              SizedBox(height: 20.h,),
              PrimaryButton(text: 'Register New Account', onTap: (){
                Get.to( SignUpScreen());
              }),
              SizedBox(height: 30.h,)
          ],),
        ),
      ),
    );
  }
}
