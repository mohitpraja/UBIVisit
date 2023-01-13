import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/components/customscroll.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/global/globalfunction.dart';
import 'package:visitantapp/core/global/validation.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black54,
        ),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/login.png",
                    height: Get.width * 0.4,
                  ),
                ),
                Form(
                  key: Validation.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: Get.height * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome !!!",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 25,
                                  fontFamily: CustomFonts.alata),
                            ),
                            Text(
                              "Login to your existing account",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontFamily: CustomFonts.alata),
                            ),
                          ],
                        ),
                        TextFormField(
                          keyboardType:TextInputType.number,
                          style: const TextStyle(color: Colors.black54),
                          validator: (value)=>Validation.isValid(value, 'Enter phone number'),
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Phone number',
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          validator: (value) =>Validation.isValid(value, 'Enter password')
                          ,
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          title: "Login",
                          onPress: () {
                            if (Validation.loginFormKey.currentState!
                                .validate()) {
                              GlobalFunction.checkInternet(
                                  context, Routes.admindash);
                            }
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
                            onPressed: () {
                              GlobalFunction.checkInternet(
                                  context, Routes.admindash);
                            },
                            label: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'login with Google',
                                style: TextStyle(
                                    color: GlobalColor.customColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    fontSize: 16,
                                    fontFamily: CustomFonts.alata),
                              ),
                            ),
                            icon: Image.asset(
                              'assets/images/google.png',
                              width: 30,
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
                                  fontSize: 16,
                                  fontFamily: CustomFonts.alata),
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(Routes.signup),
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    fontFamily: CustomFonts.alata),
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
