import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/routes.dart';

class UpdatePassController extends GetxController {
  TextEditingController confirmPassword = TextEditingController();
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

  var phone = Get.arguments;
  updatePassword(context) async {
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

      FBase.updatePass(phone[0], password).then((value) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Success',
          desc: 'You have successfully reset your password',
          dismissOnTouchOutside: false,
          btnOkOnPress: () => Get.offAllNamed(Routes.login),
        ).show();
      });
    }
  }
}
