import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';

class GoogleSignupController extends GetxController {
  TextEditingController confirmPassword = TextEditingController();
  late var name = '';
  late var email = '';
  var phone = '';
  var password = '';

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

  gotoOtp(context) {
    if (Validation.signupFormKey.currentState!.validate()) {
      sendOtp(context);
    }
  }

  sendOtp(context) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                title: 'Error',
                desc: '${e.message}')
            .show();
      },
      codeSent: (String verificationId, int? resendToken) {
        GlobalFunction.checkInternet(
            context, Routes.otp, [name, email, phone, password]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
