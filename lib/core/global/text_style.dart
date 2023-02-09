import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';

abstract class ThemeText {
  static FontWeight fontWeight = FontWeight.bold;
  static FontWeight fontWeight5 = FontWeight.w500;
  static FontWeight normalFontWeight = FontWeight.normal;

  static TextStyle heading2Style = TextStyle(
      color: GlobalColor.black54,
      fontSize: Get.width * 0.05,
      fontFamily: GoogleFonts.alata().fontFamily);
  static TextStyle headingBlack = TextStyle(
      fontSize: Get.width * 0.08,
      fontWeight: normalFontWeight,
      fontFamily: CustomFonts.alata,
      color: GlobalColor.black,
      letterSpacing: 1);
  static TextStyle headingWhite = TextStyle(
      fontSize: Get.width * 0.07,
      fontWeight: normalFontWeight,
      fontFamily: CustomFonts.alata,
      color: GlobalColor.white,
      letterSpacing: 1);

  static TextStyle userHeading = TextStyle(
      color: GlobalColor.black54,
      fontSize: Get.width * 0.065,
      fontFamily: GoogleFonts.alata().fontFamily);

  static TextStyle profileHeading = TextStyle(
      fontSize: Get.width * 0.05,
      fontWeight: fontWeight5,
      fontFamily: CustomFonts.alata);

  static TextStyle whiteMinHeading = TextStyle(
      fontSize: Get.width * 0.06,
      fontWeight: normalFontWeight,
      fontFamily: CustomFonts.alata,
      color: GlobalColor.white,
      letterSpacing: 1);

  static TextStyle whiteMedHeading = TextStyle(
      fontSize: Get.width * 0.045,
      fontWeight: normalFontWeight,
      fontFamily: CustomFonts.alata,
      color: GlobalColor.white,
      letterSpacing: 1);


  static TextStyle BlueMinHeading = TextStyle(
      color: GlobalColor.customColor,
      fontSize: Get.width * 0.05,
      fontWeight: fontWeight5,
      fontFamily: GoogleFonts.alata().fontFamily);


}