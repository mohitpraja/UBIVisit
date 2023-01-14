import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/global/globalfunction.dart';
import 'package:visitantapp/core/routes.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formValidation = GlobalKey<FormState>();



  void loginButton() {
    var isValid = formValidation.currentState?.validate();
    if (isValid!) {
      GlobalFunction.checkInternet(
          context, Routes.admindash);
      return null;
    } else {
      print('Form Validation');
    }
  }


}
