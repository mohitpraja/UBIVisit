import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{


  void signupButton() {
    var isValid = formKey.currentState?.validate();
    if (isValid!) {
      Get.toNamed(Routes.otp);
      return null;
    } else {
      print('Form Validation');
    }
  }
 
  }