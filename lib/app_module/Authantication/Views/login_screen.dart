import 'package:aiidar_restaurant_app/app_module/Authantication/Controller/auth_controller.dart';
import 'package:aiidar_restaurant_app/app_module/Authantication/Views/enter_email_screen.dart';
import 'package:aiidar_restaurant_app/utils/app_color.dart';
import 'package:aiidar_restaurant_app/utils/app_toast.dart';
import 'package:aiidar_restaurant_app/widgets/custom_textfield.dart';
import 'package:aiidar_restaurant_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                AppText(
                    text: 'Get started with App',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600),
                AppText(
                    text: 'Login or signup to use app',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: 30.h,
                ),
                AppTextField(
                  lable: 'Email Address',
                  hintText: 'Enter Email address',
                  controller: authController.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),

                AppTextField(
                  lable: 'Password',
                  controller: authController.passwordController,
                  hintText: 'Enter Password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },

                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() {
                  return authController.isLoading.isTrue? Center(child: appLoader(),):PrimaryButton(text: 'Login', onTap: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signIn();
                    }else{
                      return;
                    }
                  });
                }),
                SizedBox(
                  height: 20.h,
                ),
                InkWell(
                  onTap: (){
                    Get.to(EnterEmailScreen());
                  },
                  child: AppText(
                      text: 'Forgot Password?',
                      fontSize: 16.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                        text: 'Don’t have an account?',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400),
                    InkWell(
                      onTap: () {
                        Get.to(SignUpScreen());
                      },
                      child: AppText(
                          text: ' Register Now',
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
