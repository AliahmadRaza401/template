import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_color.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final bool isPassword;
  final bool enable;
  Widget? suffixIcon;
  final Widget? preffixIcon;
  final EdgeInsets? padding;
  final bool hasSuffix;
  final bool hasPreffix;
  final bool hasTopIcon;
  final int? maxLength;
  final VoidCallback? onTap;
  final Color suffixIconColor;
  final double suffixIconSize;
  final Color preffixIconColor;
  final double preffixIconSize;
  final VoidCallback? suffixIconFunction;
  final Color themeColor;
  final Color backcolor;
  final bool enabledBorder;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final String? Function(String?)? onComplete;
  final String? Function(String?)? onSaved;
  final String? Function()? onEditingComplete;
  double? textFieldheight;
  TextAlign? textAlign;
  List<TextInputFormatter>? inputFormatters;
  String lable;

  AppTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enable = true,
    this.suffixIcon,
    this.inputFormatters,
    this.enabledBorder = false,
    this.suffixIconFunction,
    this.lable = '',
    this.validator,
    this.hasSuffix = false,
    this.hasPreffix = true,
    this.backcolor = Colors.transparent,
    this.themeColor = AppColors.primaryColor,
    this.suffixIconColor = Colors.white,
    this.suffixIconSize = 20,
    this.preffixIconColor = Colors.white,
    this.preffixIconSize = .06,
    this.onChange,
    this.onTap,
    this.onComplete,
    this.preffixIcon,
    this.onSaved,
    this.onEditingComplete,
    this.maxLines = 1,
    this.padding,
    this.hasTopIcon = false,
    this.maxLength,
    this.textFieldheight,
    this.textAlign,
  }) : super(key: key);

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
            /*Container(
              margin: const EdgeInsets.only(bottom: 10),
              width: double.infinity,
              // height: 60.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.greyColor),
                  borderRadius: BorderRadius.circular(6.r)
                  // borderRadius: BorderRadius.circular(10),
                  ),
              padding: const EdgeInsets.all(0),
              child:*/
            TextFormField(
              enabled: enable,
              controller: controller,
              maxLines: maxLines,
              onTap: onTap,
              textAlign: textAlign ?? TextAlign.start,
              textInputAction: TextInputAction.next,
              cursorColor: themeColor,
              maxLength: maxLength,
              obscureText: isPassword,
              obscuringCharacter: "*",
              keyboardType: keyboardType,
              onFieldSubmitted: onComplete,
              onChanged: onChange,
              onSaved: onSaved,
              onEditingComplete: onEditingComplete,
              inputFormatters: inputFormatters ?? [],
              validator: validator,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.greyColor)),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColor)),
                disabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(.5))),
                contentPadding: EdgeInsets.only(left: 10.w, bottom: 30.h),
                hintText: hintText,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: 'Poppins'),
                suffixIcon: hasSuffix
                    ? InkWell(
                        onTap: suffixIconFunction,
                        child: suffixIcon ??
                            (isPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility)),
                      )
                    : const SizedBox(),
                prefixIcon: hasPreffix ? preffixIcon : null,
                isDense: true,
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}

class AppPinPutField extends StatelessWidget {
  TextEditingController? controller;
  final String? Function(String?)? onComplete;
  String lable;
  final String? Function(String?)? validator;

  AppPinPutField({
    Key? key,
    this.controller,
    this.lable = '',
    this.onComplete,
    this.validator
  }) : super(key: key);
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.primaryColor),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
          Pinput(
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            validator: validator,
            length: 6,
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: onComplete,
          )
        ],
      ),
    );
  }
}
