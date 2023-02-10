import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/routes.dart';

class ForgotController extends GetxController {
  TextEditingController phone = TextEditingController();
  resetPassword(context) async {
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
      Get.back();
      FBase.checkUser(phone.text, '').then((value) {
        if (FBase.isPhoneExist) {
          sendOtp(context, phone.text);
        } else {
          CustomSnackbar(msg: 'Phone number not registered', title: 'Warning')
              .show1();
        }
      });
    }
  }

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
        GlobalFunction.checkInternet(
            context, Routes.forgototp, [phone, verificationId]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
