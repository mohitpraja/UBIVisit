import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: Get.width,
            height: Get.height,
            color: Colors.indigo,
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
                    bottom: 30,
                    child: Text(
                      'MADE BY UBI',
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 4,
                          fontSize: 16,
                          fontFamily: GoogleFonts.alata().fontFamily),
                    ))
              ],
            )));
  }
}
