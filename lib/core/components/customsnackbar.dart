import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/global.dart';

class CustomSnackbar {
  final String title;
  final String msg;

  const CustomSnackbar({required this.title, required this.msg});

  show() {
    Get.snackbar(title, msg,
        backgroundColor: Colors.white, colorText: GlobalColor.customColor);
  }

  show1() {
    Get.snackbar(title, msg,
        backgroundColor: GlobalColor.customColor,
        duration: const Duration(milliseconds: 800),
        colorText: Colors.white);
  }
}
