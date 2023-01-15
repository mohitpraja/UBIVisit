import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';

class SignupController extends GetxController {
  TextEditingController confirmPassword = TextEditingController();
  var name = '';
  var email = '';
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
      sendOtp(context, phone);
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
      codeAutoRetrievalTimeout: (String verificationId) {},
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
        FBase.addUser(name,email,phone,password);
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Success',
          desc: 'You have successfully signup go back to login',
          dismissOnTouchOutside: false,
          btnOk: Center(
              child: GestureDetector(
                  onTap: () => Get.offAllNamed(Routes.login),
                  child: Text(
                    'Ok',
                    style: TextStyle(
                        color: GlobalColor.customColor,
                        fontWeight: FontWeight.bold),
                  ))),
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      const CustomSnackbar(msg: 'Invalid OTP', title: 'Warning').show();
    }
  }
}
