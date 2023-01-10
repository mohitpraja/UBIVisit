import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/routes.dart';

class WelcomeView extends GetView {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 5,
      ),
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/welcome2.png"),
                fit: BoxFit.fill),
          )),
          Positioned(
              bottom: 0,
              child: SizedBox(
                  width: Get.width,
                  height: Get.height * 0.58,
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: CustomFonts.alata,
                                  color: Colors.white,
                                  letterSpacing: 1),
                            ),
                            Text(
                              'UBIVisit',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: CustomFonts.alata,
                                  color: Colors.white,
                                  letterSpacing: 1),
                            )
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.8,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(Routes.login);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const StadiumBorder(),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: GlobalColor.customColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            SizedBox(
                              width: Get.width * 0.8,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.toNamed(Routes.signup);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: const StadiumBorder(),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Signup for Admin',
                                    style: TextStyle(
                                        color: GlobalColor.customColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )))
        ],
      ),
    );
  }
}
