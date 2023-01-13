import 'package:flutter/cupertino.dart';

class Validation{
  static final loginFormKey=GlobalKey<FormState>();
  static final signupFormKey=GlobalKey<FormState>();
  static final forgotFormKey=GlobalKey<FormState>();

  static isValid(val,msg){
    if(val==null||val.isEmpty){
      return msg;
    }
  }
  
  
}