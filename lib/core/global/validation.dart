import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Validation {
  static final loginFormKey = GlobalKey<FormState>();
  static final signupFormKey = GlobalKey<FormState>();
  static final addvisitor = GlobalKey<FormState>();
  static final forgotFormKey = GlobalKey<FormState>();
  static final guardFormKey = GlobalKey<FormState>();
  static final employeeFormKey = GlobalKey<FormState>();
  static final updatepassFormKey = GlobalKey<FormState>();
  static final googleSignupFormKey = GlobalKey<FormState>();
  static final adminProfileFormKey = GlobalKey<FormState>();

  static isValid(val,msg) {
    if (val == null || val.isEmpty) {
      return msg;
    }
  }

  static RxBool isPass = true.obs;
  static showPass() {
    if (isPass.value == true) {
      isPass.value = false;
    } else {
      isPass.value = true;
    }
  }

  static phoneValidator(value) {
    if (value!.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Incorrect Phone Number';
    } else {
      return null;
    }
  }
  static  passwordValidator(value) {
    if (value!.isEmpty || !RegExp(r'(?=.*?[#?!@$%^&*-]).{6,}$').hasMatch(value)) {
      return 'Passwords must have at least one special character';
    } else {
      return null;
    }
  }

  static  nameValidator(value) {
    if (value!.isEmpty || !RegExp(r'^[a-z A-Z/+0-9]+$').hasMatch(value) ||RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Enter Correct Field';
    } else {
      return null;
    }
  }

  static  emailValidator(value) {
    if (value!.isEmpty ||
        !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
            .hasMatch(value)) {
      return 'Enter Correct Email';
    } else {
      return null;
    }
  }

  static confirmValidator(value, password) {
    if (value!.isEmpty) {
      return 'Confirm Password required';
    }
    if (value != password) {
      return 'Password Do Not Match';
    }
    return null;
  }
}
