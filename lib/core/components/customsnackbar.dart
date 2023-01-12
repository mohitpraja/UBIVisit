import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  late final String title;
  late final String message;
  CustomSnackbar({required this.title,required this.message});

  show(){
    Get.snackbar(title, message,
      backgroundColor: Colors.white,
        colorText: Colors.indigo,
        borderColor: Colors.indigo,
        borderWidth: 1,
        dismissDirection: DismissDirection.horizontal,
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     child: show(),
  //
  //   );

  }

