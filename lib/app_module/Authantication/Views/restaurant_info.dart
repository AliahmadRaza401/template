import 'package:aiidar_restaurant_app/utils/app_color.dart';
import 'package:aiidar_restaurant_app/utils/app_images.dart';
import 'package:aiidar_restaurant_app/widgets/custom_textfield.dart';
import 'package:aiidar_restaurant_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text.dart';
import '../Controller/auth_controller.dart';
import 'signup_screen.dart';

class RestaurantInfoScreen extends StatelessWidget {
  RestaurantInfoScreen({super.key});

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
                      text: 'Enter Personal Information',
                      fontSize: 22.sp,
                      maxLines: 2,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600),
                  AppText(
                      text:
                          'Please upload the required documents mentioned in the registration form.',
                      fontSize: 15.sp,
                      maxLines: 2,
                      fontWeight: FontWeight.w400),
                  AppText(
                      text: 'Accepted file types: PDF, JPG, PNG',
                      fontSize: 15.sp,
                      maxLines: 2,
                      fontWeight: FontWeight.w400),
                  SizedBox(
                    height: 20.h,
                  ),
                  FilePickContainer(lable: 'Photo', onTap: () {}),
                  FilePickContainer(lable: 'NIC', onTap: () {}),
                  FilePickContainer(lable: 'Restaurant paper', onTap: () {}),
                  AppTextField(
                    lable: 'Restaurant Address',
                    hintText: 'Enter Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm Password is required';
                      }
                      return null;
                    },
                    controller: authController.restAddressController,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Obx(() {
                    return authController.isLoading.isTrue
                        ? Center(child: AppLoader())
                        : PrimaryButton(
                            text: 'Submit',
                            onTap: () {
                              // if (_formKey.currentState!.validate()) {
                              //   authController.signUp();
                              // } else {
                              //   return;
                              // }
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
      ),
    );
  }
}

class FilePickContainer extends StatelessWidget {
  String lable;
  VoidCallback onTap;

  FilePickContainer({Key? key, this.lable = '', required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            lable.isNotEmpty
                ? AppText(
                    text: lable, fontSize: 16.sp, fontWeight: FontWeight.w500)
                : const SizedBox.shrink(),
            lable.isNotEmpty
                ? SizedBox(
                    height: 10.h,
                  )
                : const SizedBox.shrink(),
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: double.infinity,
                // height: 60.h,
                decoration: BoxDecoration(
                    color: AppColors.greyColor.withOpacity(.4),
                    borderRadius: BorderRadius.circular(6.r)),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.pickFileIcon, height: 26.h),
                    SizedBox(
                      width: 10.w,
                    ),
                    AppText(
                      text: 'Upload File',
                      fontSize: 15.sp,
                      color: Colors.grey,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
