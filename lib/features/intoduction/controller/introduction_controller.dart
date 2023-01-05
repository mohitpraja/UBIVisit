import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionController extends GetxController {
  PageDecoration pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontFamily: GoogleFonts.josefinSans().fontFamily,
      fontWeight: FontWeight.bold,
      color: Colors.black54,
    ), //tile font size, weight and color
  );
}
