import 'dart:async';
import 'package:aiidar_restaurant_app/app_module/Authantication/Views/login_screen.dart';
import 'package:aiidar_restaurant_app/utils/app_images.dart';
import 'package:aiidar_restaurant_app/widgets/custom_text.dart';
import 'package:aiidar_restaurant_app/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';

// OnBoarding content Model
class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
    image: AppImages.OnbaordingImage1,
    title: "Electronic Music",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image:AppImages.OnbaordingImage1,
    title: "Pop Music",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
  OnBoard(
    image:AppImages.OnbaordingImage1,
    title: "Jazz Music",
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  ),
];

// OnBoardingScreen
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Variables
  late PageController _pageController;
  int _pageIndex = 0;


  @override
  void initState() {
    super.initState();
    // Initialize page controller
    _pageController = PageController(initialPage: 0);
    // Automatic scroll behaviour
    // _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
    //   if (_pageIndex < 3) {
    //     _pageIndex++;
    //   } else {
    //     _pageIndex = 0;
    //   }

    // _pageController.animateToPage(
    //   _pageIndex,
    //   duration: const Duration(milliseconds: 350),
    //   curve: Curves.easeIn,
    // );
    // });
  }

  @override
  void dispose() {
    // Dispose everything
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Carousel area
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemCount: demoData.length,
            controller: _pageController,
            itemBuilder: (context, index) => OnBoardContent(
              title: demoData[index].title,
              description: demoData[index].description,
              image: demoData[index].image,
            ),
          ),

          // Indicator area
          Positioned(
            bottom: 120,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  demoData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(
                      isActive: index == _pageIndex,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Button area
          Positioned(
            bottom: 20,
            right: 0,
            left: 0,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  if(_pageIndex<2) {
                    setState(() {
                      _pageIndex = _pageIndex + 1;
                      _pageController.animateToPage(
                        _pageIndex,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn,
                      );
                    });
                  }else{
                    Get.offAll( LoginScreen());
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Next',
                      style: TextStyle(fontSize: 16.sp,color: AppColors.primaryColor),
                    ),
                    const SizedBox(width: 10,),
                    Icon(Icons.arrow_forward_rounded, size: 18.w,color: AppColors.primaryColor,)
                  ],
                ),
              ),
            ),
          ),

          // Positioned(
          //   right: 20,
          //   child:  SafeArea(
          //     child: InkWell(
          //       onTap: (){
          //         Get.offAll( Login());
          //       },
          //       child: Text(
          //       'Skip',
          //       style: TextStyle(fontSize: 16.sp,color: Colors.white),
          //                 ),
          //     ),
          //   ),)
          // SizedBox(height: 80)
        ],
      ),
    );
  }
}

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      //
      // ),

      child: /*Stack(

        children: [*/
          // Positioned(
          //   bottom: 0,
          //   child: Container(
          //     width: Get.width,
          //     height: 438.h,
          //     decoration: const BoxDecoration(
          //       image: DecorationImage(image: AssetImage('assets/app_images/gradient_bg.png'), fit: BoxFit.cover),
          //
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const Spacer(),

                SizedBox(
                  height: 80.h,
                ),
                Image.asset(image,scale: 4),

                Column(
                  children: [
                    AppText(
                      text: title,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AppText(
                      text: description,
                      fontSize: 16.sp,
                      softWrap: true,
                      ellipsisText: true,
                      maxLines: 7,
                      alignText: TextAlign.center,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 80,
                )
                // const Spacer(),
                // Image.asset(image),
                // const Spacer(),
              ],
            ),
          ),

        /*],
      ),*/
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 8,
      decoration: const BoxDecoration(
        color:  AppColors.primaryColor,
        // border:
        //     isActive ? null : Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
