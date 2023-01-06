import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHomeView extends GetView {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 20, fontFamily: GoogleFonts.alata().fontFamily),
        ),
      ),
      drawer: Drawer(
        width: Get.width * 0.70,
      ),
      body: const Text('home'),
    );
  }
}
