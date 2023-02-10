import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/global.dart';

class CustomSnackbar {
  final String title;
  final String msg;
  final Widget? titleText= Text('Success',style:TextStyle(color:GlobalColor.customColor,fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.center,);
  final Widget? msgText= Text('successfully Timeout',style:TextStyle(color:GlobalColor.customColor,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,);
  CustomSnackbar({required this.title, required this.msg});

  show() {
    Get.snackbar(title, msg,
        backgroundColor: Colors.white, colorText: GlobalColor.customColor,snackPosition:SnackPosition.BOTTOM,titleText: titleText,messageText:msgText  );
  }

  show1() {
    Get.snackbar(title, msg,
        backgroundColor: GlobalColor.customColor,

        duration: const Duration(milliseconds: 800),

        colorText: Colors.white);
  }
}