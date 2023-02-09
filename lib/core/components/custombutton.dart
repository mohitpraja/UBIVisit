import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';

class CustomButton extends GetView {
  final String title;
  final VoidCallback onPress;
  final TextStyle? style;
  final Color? color;
  final ShapeBorder? shape;
  final double? width;
  const CustomButton({super.key, required this.title, required this.onPress, this.style, this.color,this.shape,this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??Get.width,
      child: MaterialButton(
        onPressed: onPress,
        color:color??GlobalColor.customColor,
        shape: shape??StadiumBorder(
            side:BorderSide(color:color??GlobalColor.customColor)
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style: style?? TextStyle(
              color: color??Colors.white,
              letterSpacing: 1,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}