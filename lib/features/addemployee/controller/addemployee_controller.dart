import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';

class AddEmployeeController extends GetxController {
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
 addEmployee(context) async {
    if(Validation.employeeFormKey.currentState!.validate()){
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
           CustomSnackbar(title: 'Warning', msg: 'This phone already ').show1();
        } else if (FBase.isEmailExist) {
          Get.back();
          CustomSnackbar(title: 'Warning', msg: 'This mail already ').show1();
        } else {
      Get.back();
      FBase.addUser(name,email, phone, password,post,'employee',FBase.userInfo['organization']).then((value){

          AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          title: 'Success',
          desc: 'You have successfully add employee',
          dismissOnTouchOutside: false,
          btnOkOnPress: () => Get.offAllNamed(Routes.admindash),
        
        ).show();
      });
        }
      });
      
    }

    }
  }
 

 
}
