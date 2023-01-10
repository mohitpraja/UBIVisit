import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../customfont.dart';
import '../global.dart';

class CustomDialogBox extends GetView {
  final String title;
  final String msg;

  const CustomDialogBox({required this.title,required this.msg});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SnackBar(content: AlertDialog(
        title:Padding(
      padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, letterSpacing: 1,fontWeight: FontWeight.w600, fontSize:Get.height*0.02,fontFamily: CustomFonts.alata),
        ),
      ),
        shape: const StadiumBorder(),
        backgroundColor: GlobalColor.customColor,
        content: Text(msg),



      ),),
    );

    
  }

}
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //       width: Get.width,
  //       child: MaterialButton(
  //       onPressed: onPress,
  //       color:GlobalColor.customColor,
  //       shape: const StadiumBorder(),
  //   child: Padding(
  //   padding: const EdgeInsets.all(10),
  //   child: Text(
  //   title,
  //   style: TextStyle(
  //   color: Colors.white, letterSpacing: 1,fontWeight: FontWeight.w600, fontSize:Get.height*0.02,fontFamily: CustomFonts.alata),
  //   ),
  //   ),