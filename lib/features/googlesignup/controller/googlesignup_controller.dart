import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';

class GoogleSignupController extends GetxController {
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

  var signupEmail = Get.arguments;
  forchk() {
    print(signupEmail);
  }

  signupByGoogle(context) async {
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
      FBase.addUser(name, signupEmail, phone, password).then((value){
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
      });
    }
  }
}
