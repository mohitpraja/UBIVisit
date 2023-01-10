import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/customfont.dart';
import 'package:visitantapp/core/routes.dart';

class WelcomeView extends GetView {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image:DecorationImage(image:AssetImage("assets/images/welcome2.png"),fit:BoxFit.cover),
        ),
       child: Scaffold(
        backgroundColor: Colors.transparent,
         body: Stack(
            children: [
              Positioned(
                top: Get.height*.55,
                  right:Get.width*0.47 ,
                  child: Text("Welcome to",style: TextStyle(fontWeight: FontWeight.w800,fontSize:28,color: Colors.white,letterSpacing: 1),)),
              Positioned(
                  top: Get.height*.61,
                  right:Get.width*0.51,
                  child: Text("UBIVisit",style: TextStyle(fontWeight: FontWeight.w800,fontSize:28,color: Colors.white,letterSpacing: 4,fontFamily: CustomFonts.alata),)),
              Positioned(
                bottom: 100,
                left:Get.width*0.1,
                child:SizedBox(
                  width: Get.width*.8,
                  child: ElevatedButton(

                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white
                          ,
                          shape: const StadiumBorder(),
                          elevation: 0),
                      onPressed: () {
                        Get.toNamed(Routes.signup);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize:Get.height*0.02,
                              fontWeight: FontWeight.w800,
                              fontFamily: CustomFonts.alata),
                        ),
                      )),
                ),),


              Positioned(
                  bottom: 40,
                  left:Get.width*0.1,
                  child:SizedBox(
                    width: Get.width*.8,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white
                            ,
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
                                fontWeight: FontWeight.w800,
                                fontFamily: CustomFonts.alata),
                          ),
                        )),
                  ),)


            ],
       ),
     ),

       );
  }
}
