import 'package:flutter/cupertino.dart';

class GlobalFunction {
  static final formkey=GlobalKey<FormState>();
  static isValid(val,msg){
    if(val==null||val.isEmpty){
      return msg;
    }
  }
  static formValid(){
    if(formkey.currentState!.validate()){
      return true;
    }else{
      return false;
    }
  }

  static checkConnection() async {
    
   
  }
  
}