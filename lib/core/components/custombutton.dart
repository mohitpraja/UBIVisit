import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';

class CustomButton extends GetView {
  final String title;
  final VoidCallback onPress;
  const CustomButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: MaterialButton(
        onPressed: onPress,
        color:GlobalColor.customColor,
        shape: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontWeight: FontWeight.w600,
                fontSize:17,
                fontFamily: CustomFonts.alata),
          ),
        ),
      ),
    );

  }
}
