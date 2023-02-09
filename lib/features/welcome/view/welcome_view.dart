import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/text_style.dart';
import 'package:ubivisit/core/routes.dart';

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
                                style: ThemeText.headingWhite
                            ),
                            Text(
                              'UBIVisit',
                              style: TextStyle(
                                  fontSize: Get.height*0.04,
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
                                        fontSize: Get.height*0.02,
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
                                    'Signup',
                                    style: TextStyle(
                                        color: GlobalColor.customColor,
                                        fontSize: Get.height*0.02,
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
