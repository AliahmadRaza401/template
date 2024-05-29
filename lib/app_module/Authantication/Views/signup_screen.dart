import 'package:aiidar_restaurant_app/utils/app_color.dart';
import 'package:aiidar_restaurant_app/widgets/custom_textfield.dart';
import 'package:aiidar_restaurant_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';
import '../Controller/auth_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  var authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  AppText(
                      text: 'Create Your Restaurant Account',
                      fontSize: 22.sp,
                      maxLines: 2,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    height: 30.h,
                  ),
                  AppTextField(
                    lable: ' Full Name',
                    hintText: 'Enter Full Name',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  AppTextField(
                    lable: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone is required';
                      }
                      return null;
                    },
                    controller: authController.fullNameController,
                  ),
                  AppTextField(
                    lable: 'Email Address',
                    hintText: 'Enter Email address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      return null;
                    },
                    controller: authController.emailController,
                  ),
                  AppTextField(
                    lable: 'Delivery Address',
                    controller: authController.deliveryAddressController,
                    hintText: 'Enter Delivery Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Delivery Address is required';
                      }
                      return null;
                    },
                  ),
                  AppTextField(
                    lable: 'Password',
                    hintText: 'Enter Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    controller: authController.passwordController,
                  ),
                  AppTextField(
                    lable: 'Confirm Password',
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      }
                      return null;
                    },
                    controller: authController.confirmPasswordController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() {
                    return authController.isLoading.isTrue
                        ? Center(child: AppLoader())
                        : PrimaryButton(
                            text: 'Next',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                authController.signUp();
                              } else {
                                return;
                              }
                            });
                  }),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                          text: 'Already have an account?',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                      AppText(
                          text: ' Login Now',
                          fontSize: 16.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppLoader extends StatelessWidget {
  Color? color;
  AppLoader({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color ?? AppColors.primaryColor,
    );
  }
}
