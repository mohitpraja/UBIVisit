import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/customfont.dart';

class WelcomeView extends GetView {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height:50,),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Text('Welcome',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                fontFamily: CustomFonts.alata,
                color: Colors.black54

            ),),
             ),
             const SizedBox(height: 30,),
            Image.asset('assets/images/welcome.png',),
            SizedBox(
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: Get.width,
                      height: 400,
                      color: Colors.indigo,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 60,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const StadiumBorder(),
                                      elevation: 0),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(11),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: CustomFonts.alata
                                          ),
                                    ),
                                  )),
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                              width: Get.width,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      shape: const StadiumBorder(),
                                      elevation: 0),
                                  onPressed: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.all(11),
                                    child: Text(
                                      'Signup for Admin',
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontSize: 17,
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
                    top: -10,
                    child: SizedBox(
                        width: Get.width,
                        height: 150,
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
