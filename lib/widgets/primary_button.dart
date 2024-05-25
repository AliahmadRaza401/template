import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_color.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  String text;
  double? height;
  double? width;
  double? textSize;
  double? radius;
  Color? color;
  Function() onTap;
  bool? iconEnable;

  PrimaryButton({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.color,
    this.radius,
    this.textSize,
    required this.onTap,
    this.iconEnable = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 335.w,
        height: height ?? 55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: text,
              fontSize: textSize ?? 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white
            ),

          ],
        ),
      ),
    );
  }
}


class PrimaryButtonWithIcon extends StatelessWidget {
  String text;
  double? height;
  double? width;
  double? textSize;
  double? radius;
  Color? color;
  Widget icon;
  Function() onTap;

  PrimaryButtonWithIcon({
    super.key,
    required this.text,
    this.height,
    this.width,
    this.color,
    this.radius,
    this.textSize,
    required this.onTap,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 335.w,
        height: height ?? 55.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 10.w,),
            AppText(
              text: text,
              fontSize: textSize ?? 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),

          ],
        ),
      ),
    );
  }
}


