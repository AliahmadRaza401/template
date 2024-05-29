import 'dart:async';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppServices{
  static Future<String> getImageSheet() async {
    Completer<String> completer = Completer();
    Get.bottomSheet(
      Container(
        color: Colors.white,
        width: Get.width,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select Image',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.grey.withOpacity(0.5)),
            InkWell(
              onTap: () async {
                String imgPath = await pickImage(
                    source: ImageSource.camera);
                completer.complete(imgPath);
                Get.back();
              },
              child: const Text(
                'Camera',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.5)),
            InkWell(
              onTap: () async {
                String imgPath = await pickImage();
                completer.complete(imgPath);
                Get.back();
              },
              child: const Text(
                'Gallery',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Divider(color: Colors.grey.withOpacity(0.5)),
            const SizedBox(height: 30)
          ],
        ),
      ),
      isScrollControlled: true,
    );

    return completer.future;
  }





  static  Future<String> pickImage({ImageSource source = ImageSource.gallery}) async {
    ImagePicker picker = ImagePicker();
    try {
      XFile? pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        return pickedFile.path;
      } else {
        return '';
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      return '';
    }
  }
}

String generate6DigitId() {
  Random random = Random();
  int randomNumber = random.nextInt(900000) + 100000;
  return randomNumber.toString();
}