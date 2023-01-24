import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/routes.dart';

class GoogleSignupController extends GetxController {
  TextEditingController confirmPassword = TextEditingController();
  var name = '';
  var email = '';
  var phone = '';
  var password = '';
  var post = '';

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
      FBase.checkUser(phone, signupEmail).then((value) {
         if (FBase.isPhoneExist) {
          Get.back();
          const CustomSnackbar(title: 'Warning', msg: 'This phone already ').show1();
        } else if (FBase.isEmailExist) {
          Get.back();
          const CustomSnackbar(title: 'Warning', msg: 'This mail already ').show1();
        } else {
      Get.back();
      FBase.addUser(name, signupEmail, phone, password,post,'').then((value){

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
      });
      
    }
  }
}
