import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/routes.dart';

class SignupController extends GetxController{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController Password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();


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