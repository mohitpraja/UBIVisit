import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/customfont.dart';
import 'package:visitantapp/core/global.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back),color: Colors.black54,),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                Center(
                  child: Image.asset(
                    "assets/images/login.png",
                    width: Get.width * 0.65,
                  ),
                ),
                Form(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: Get.height * 0.58,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome Back!!!",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: Get.height * 0.03,
                                  fontFamily: CustomFonts.alata),
                            ),
                            Text(
                              "Login in to your existant account",
                              style: TextStyle(
                                  fontSize: Get.height * 0.018,
                                  color: Colors.grey,
                                  fontFamily: CustomFonts.alata),
                            ),
                          ],
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Phone number',
                              prefixIcon: const Icon(Icons.person),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GlobalColor.customColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(Icons.lock),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GlobalColor.customColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Get.toNamed(Routes.forgot),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: GlobalColor.customColor,
                                    fontFamily: CustomFonts.alata,
                                    fontSize: Get.height * 0.018),
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          title: "Login",
                          onPress: () {
                            Get.toNamed(Routes.admindash);
                          },
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Expanded(
                                  child: Divider(
                                color: Colors.black54,
                              )),
                              Text(
                                "  or connnect using  ",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: CustomFonts.alata),
                              ),
                              const Expanded(
                                  child: Divider(
                                color: Colors.black54,
                              )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            label: Padding(
                              padding: const EdgeInsets.symmetric(vertical:10),
                              child: Text(
                                'Google',
                                style: TextStyle(
                                    color: GlobalColor.customColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    fontSize: Get.height * 0.02,
                                    fontFamily: CustomFonts.alata),
                              ),
                            ),
                            
                            icon: Image.asset(
                              'assets/images/google.png',
                              width:30,
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.indigo)),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize:Get.height*0.02,
                                fontFamily: CustomFonts.alata
                              ),
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(Routes.signup),
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w600,
                                     fontSize:Get.height*0.021,
                                fontFamily: CustomFonts.alata
                                    ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
