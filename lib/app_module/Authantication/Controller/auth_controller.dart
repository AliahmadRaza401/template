import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:intl/intl.dart';

class AuthController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController restAddressController = TextEditingController();

  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  final FirebaseAuth auth = FirebaseAuth.instance;

  static String? errorMessage;
  RxBool isLoading = false.obs;
  String? uerid;
  Rx<String> userProfileImage = "".obs;
  RxString userDetailedID = "".obs;
  // Location location = Location();
  RxString latitudeValue = ''.obs;
  RxString longitudeValue = ''.obs;

  RxBool pushNotificationBool = false.obs;
  RxBool locationAccessInfoBool = false.obs;
  RxString verificationCode = ''.obs;
  RxString verificationID = ''.obs;
  RxString phoneNumVal = ''.obs;
  RxString ticketCountry = ''.obs;
  RxBool verifyPhoneNum = false.obs;
  final loading = false.obs;

  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  setLoading(value) {
    loading.value = value;
    update();
  }

  updateLocation(locationVal) {
    locationAccessInfoBool.value = locationVal;
    update();
  }

  updateTicketCountryValue(String val) {
    ticketCountry.value = val;
    update();
  }

  updatepushNotification(notificationVal) {
    pushNotificationBool.value = notificationVal;
    update();
  }

  // updateDOB(String dateVal) {
  //   AppTextfieldControllers.dateOfBirth = TextEditingController(text: dateVal);
  //   log(AppTextfieldControllers.dateOfBirth.value.toString());
  //   update();
  // }

  // Verify Phone Type
  verifyPhoneFun(String userValue) {
    phoneNumVal.value = userValue;
    log('phoneController.text === ${phoneNumVal.value}');
    update();
  }

  final dateFormat = DateFormat('MM/dd/yyyy');
  String errorText = '';

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      dobController.text = dateFormat.format(picked);
    }
  }

  // verifyUserPhoneNumber
  void verifyUserPhoneNumber() {
    verifyPhoneNum.value = true;
    update();
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumVal.value,
      // phoneNumber: '+92 30475765067',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        log('exception === ${e.code}');
        Fluttertoast.showToast(msg: e.code.toString());

        verifyPhoneNum.value = false;
        update();
      },
      codeSent: (String verificationId, int? resendToken) {
        verificationID.value = verificationId;
        log('verificationId ==== $verificationID');
        verifyPhoneNum.value = false;
        update();
        // Get.to(() => const NumberVerificationScreen());
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verifyPhoneNum.value = false;
        update();
        // AppToast.failToast('Time Out');
      },
    );
  }

// Verify OTP
  Future<void> verifyOTPCode() async {
    setLoading(true);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID.value,
      // verificationId: '883051',
      smsCode: verificationCode.value,
    );

    await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      log('User Login In Successful');
      signUp();
    }).catchError((error) {
      Fluttertoast.showToast(msg: 'Code Not True ');
      setLoading(false);
    });
    setLoading(false);
  }

  //SignIn
  Future<void> signIn() async {
    try {
      isLoading(true);
      update();
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim())
          .then((user) => {
                log('Signin succesfully'),
                if (user != null)
                  {
                    /// TODO navigation
                    update(),
                    isLoading(false),
                    clearTextFields()
                  }
              });

      // ignore: body_might_complete_normally_catch_error
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid.";

          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "your password or email address is invalid";
      }
      Fluttertoast.showToast(msg: errorMessage.toString());
      log(errorMessage.toString());

      isLoading(false);

      update();
    }
  }

  // SignUp-----------------------------------------
  Future<void> signUp() async {
    try {
      isLoading(true);
      update();
      log('Signup start =========');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          )
          .then((value) => {
                log("User Created_________"),
                addUser(),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        case "email-already-in-use":
          errorMessage =
              " The email address is already in use by another account.";
          break;
        case "weak-password":
          errorMessage = "Password should be at least 6 characters";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      Fluttertoast.showToast(msg: errorMessage.toString());
      log(errorMessage.toString());
      log('Signup FirebaseAuthException  =========$error');
      isLoading(false);

      update();
    }
  }

  // SignOut
  Future<void> signOut() async {
    isLoading(true);

    await FirebaseAuth.instance.signOut().then((value) {
      isLoading(false);

      Get.toNamed("/welcomeScreen");
      log('Sign out succesfully');
    }).catchError((e) {
      log('Signout Error  =========$e');
      Fluttertoast.showToast(msg: 'Error: $e');
      isLoading(false);
    });
  }

  //password Change
  passwordChange(String password) async {
    try {
      await FirebaseAuth.instance.currentUser!
          .updatePassword(password)
          .then((value) {
        log('Password updated succesfully');
        signOut();
      });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address is invalid.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "your password or email address is invalid";
      }

      return "false";
    }
  }

//  Forget Password
  Future<void> forgetPassword(String email) async {
    isLoading(true);

    update();
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((value) {
        Fluttertoast.showToast(msg: 'Email Send for Password Reset');

        Get.toNamed("/welcomeScreen");
        isLoading(false);

        update();
      });
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message.toString());
      isLoading(false);

      update();
    }
  }

  clearTextFields() {
    emailController.clear();
    passwordController.clear();
    fullNameController.clear();
    dobController.clear();
    phoneController.clear();
    confirmPasswordController.clear();
    update();
  }

  Future<void> addUser() async {
    log('user is Adding....... ');
    try {
      userCollection.doc(auth.currentUser!.uid).set({
        "uid": auth.currentUser!.uid,
        'name': fullNameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'fcm_token': await FirebaseMessaging.instance.getToken(),
        'dob': dobController.text,
        'password': passwordController.text,
      }).then((value) async {
        log("user Added");
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(fullNameController.text.trim());
        await signIn();
        // Get.toNamed("/welcomeScreen");
        isLoading(false);
        clearTextFields();
        update();
      }).catchError((error) {
        log("Failed to add Product: $error");
        Fluttertoast.showToast(msg: "Error : $error");
        isLoading(false);
        update();
      });
      Fluttertoast.showToast(msg: "User Created Succesfully");
    } catch (e) {
      Fluttertoast.showToast(msg: "Error : $e");
      log('Error = $e');
      isLoading(false);
      update();
    }
  }

  storeUserImage(File imageFile) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(imageFile);
    try {
      await uploadTask;
      String? imageUrl;
      await ref.getDownloadURL().then((value) async {
        imageUrl = value;
        await updateUserimage(imageUrl!);
        log('User Profile Pic updated Successfully====');
        log(imageUrl!);
      });

      // await updateUserimage(imageUrl);
      // return imageUrl;
    } catch (e) {
      log('Error uploading image: $e');
      // return '';
    }
  }

  updateUserimage(String url) {
    userProfileImage.value = url;
    FirebaseAuth.instance.currentUser!.updatePhotoURL(url);
    log('photiooo === ${FirebaseAuth.instance.currentUser!.photoURL.toString()}');
    update();
  }

// get User Current location
//   Future<void> getCurrentLocation() async {
//     try {
//       LocationData locationData = await location.getLocation();
//       latitudeValue.value = locationData.latitude!.toString();
//       longitudeValue.value = locationData.longitude!.toString();
//       // LatLng(locationData.latitude!, locationData.longitude!);
//       log('latitude === ${latitudeValue.value}');
//       log('longitude === ${longitudeValue.value}');
//       update();
//     } catch (e) {
//       log("Error: $e");
//     }
//   }
}
