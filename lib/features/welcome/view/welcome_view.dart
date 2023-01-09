import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/customfont.dart';
import 'package:visitantapp/core/routes.dart';

class WelcomeView extends GetView {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height:Get.height*0.05,),
             Padding(
               padding: EdgeInsets.only(left: Get.width*0.05),
               child: Text('Welcome',style: TextStyle(
                fontSize:Get.height*0.04,
                fontWeight: FontWeight.w500,
                fontFamily: CustomFonts.alata,
                color: Colors.black54

            ),),
             ),
             SizedBox(height:Get.height*0.05,),
            Image.asset('assets/images/welcome.png',height:Get.height*0.35,),
            SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: Get.width,
                      color: Colors.indigo,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                      height:Get.height*0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height:Get.height*0.1,),
                            SizedBox(
                              width: Get.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const StadiumBorder(),
                                      elevation: 0),
                                  onPressed: () {
                                    Get.toNamed(Routes.login);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize: Get.height*0.02,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: CustomFonts.alata
                                          ),
                                    ),
                                  )),
                            ),
                             SizedBox(height:Get.height*0.02,),
                            SizedBox(
                              width: Get.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const StadiumBorder(),
                                      elevation: 0),
                                  onPressed: () {
                                    Get.toNamed(Routes.signup);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(11),
                                    child: Text(
                                      'Signup for Admin',
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize:Get.height*0.02,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: CustomFonts.alata),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -5,
                    child: SizedBox(
                        width: Get.width,
                        child: Image.asset(
                          'assets/images/welcomewave.png',
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
