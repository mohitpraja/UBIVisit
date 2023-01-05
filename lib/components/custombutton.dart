import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends GetView {
  final String title;
  final VoidCallback onpress;
  const CustomButton({super.key, required this.title, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: MaterialButton(
        onPressed: onpress,
        color: Colors.indigo,
        shape: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            title,
            style:
                const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
