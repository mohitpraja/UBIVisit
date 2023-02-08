import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';

class SignupController extends GetxController {
  TextEditingController confirmPassword = TextEditingController();
  var name = '';
  var email = '';
  var phone = '';
  var password = '';
  var post = '';
  var organization = '';

  RxBool isPass = true.obs;
  RxBool isConfirmPass = true.obs;
  showPass() {
    if (isPass.value == true) {
      isPass.value = false;
    } else {
      isPass.value = true;
    }
  }

  showConfirmPass() {
    if (isConfirmPass.value == true) {
      isConfirmPass.value = false;
    } else {
      isConfirmPass.value = true;
    }
  }

  gotoOtp(context) async {
    if (Validation.signupFormKey.currentState!.validate()) {
      CustomLoader.showLoader(context);
      if (!(await InternetConnectionChecker().hasConnection)) {
        Get.back();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        FBase.checkUser(phone, email).then((value) {
          if (FBase.isPhoneExist) {
            Get.back();
            const CustomSnackbar(title: 'Warning', msg: 'This phone already ')
                .show1();
          } else if (FBase.isEmailExist) {
            Get.back();
            const CustomSnackbar(title: 'Warning', msg: 'This mail already ')
                .show1();
          } else {
            Get.back();
            sendOtp(context, phone);
          }
        });
      }
    }
  }

  String verificationID = "";
  sendOtp(context, phone) async {
    CustomLoader.showLoader(context);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        Get.back();
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                title: 'Error',
                desc: '${e.message}')
            .show();
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.back();
        verificationID = verificationId;
        GlobalFunction.checkInternet(
            context, Routes.otp, [name, email, phone, password]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
       
      },
    );
  }

  verifyOTP(otp, context) async {
    CustomLoader.showLoader(context);
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otp);
    try {
      final authCred =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      if (authCred.user != null) {
        Get.back();
        FBase.addUser(name, email, phone, password,'Admin', '',organization).then((value) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Success',
            desc: 'You have successfully signup go back to login',
            dismissOnTouchOutside: false,
            btnOkOnPress: () => Get.offAllNamed(Routes.login),
          ).show();
        });
      }
    } on FirebaseAuthException {
      Get.back();
       AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            title: 'Error',
            desc: 'invalid OTP',
            dismissOnBackKeyPress: true
          ).show();
      // const CustomSnackbar(msg: 'Invalid OTP', title: 'Warning').show();
      // Get.back();
    }
  }
}
