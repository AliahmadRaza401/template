import 'package:aiidar_restaurant_app/app_module/Authantication/Controller/auth_controller.dart';
import 'package:aiidar_restaurant_app/utils/app_color.dart';
import 'package:aiidar_restaurant_app/utils/app_toast.dart';
import 'package:aiidar_restaurant_app/widgets/custom_textfield.dart';
import 'package:aiidar_restaurant_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';
import 'signup_screen.dart';
import 'verify_otp_screen.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  var authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: 'Reset Password',
                    fontSize: 22.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600),
                AppText(
                    text: 'Please enter new password here',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400),
                SizedBox(
                  height: 30.h,
                ),
                AppTextField(
                  lable: 'Password',
                  hintText: 'Enter Password',
                  controller: authController.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),AppTextField(
                  lable: 'Confirm Password',
                  hintText: 'Confirm Password',
                  controller: authController.confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Obx(() {
                  return authController.isLoading.isTrue
                      ? Center(
                          child: appLoader(),
                        )
                      : PrimaryButton(
                          text: 'Save',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                             Get.to(VerifyOtpScreen());
                            } else {
                              return;
                            }
                          });
                }),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
