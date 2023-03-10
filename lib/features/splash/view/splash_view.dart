import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubivisit/core/global/global.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: Get.width,
            height: Get.height,
            color: GlobalColor.customColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                    child: Image.asset(
                  "assets/images/splash.gif",
                  width: Get.width,
                  height: Get.height * 0.5,
                )),
                Positioned(
                    bottom: 35,
                    child: Text(
                      'MADE BY UBITECH',
                      style: TextStyle(
                          color: GlobalColor.white,
                          letterSpacing: 4,
                          fontSize: Get.width*0.05,
                          fontFamily: GoogleFonts.alata().fontFamily),
                    ))
              ],
            )));
  }
}
