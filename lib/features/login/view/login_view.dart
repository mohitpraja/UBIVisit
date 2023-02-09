// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/components/customtextform.dart';
import 'package:ubivisit/core/components/passwordfield.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/text_style.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        colors: Colors.black,
        color: Colors.white,
        onPress: () {
          Get.back();
        },
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
                    height: Get.height * 0.16,
                  ),
                ),
                Form(
                  key: Validation.loginFormKey,
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    height: Get.height * 0.66,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Welcome !!!",
                                style: ThemeText.headingBlack
                            ),
                            Text(
                              "Login to your existing account",
                                style: ThemeText.heading2Style
                            ),
                          ],
                        ),
                        CustomTextFormField(
                          hintText: 'Phone Number',
                          icon: const Icon(Icons.person),
                          maxLength: 10,
                          validator: (value){
                            return  Validation.phoneValidator(value);
                          },
                          controller: controller.phone),

                        PasswordField(
                          validator: (value){
                            return  Validation.passwordValidator(value);
                          },
                          controller: controller.pass,
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
                                    fontSize: Get.height * 0.02),
                              ),
                            ),
                          ],
                        ),
                        CustomButton(
                          title: "Login",
                          onPress: () {
                            if (Validation.loginFormKey.currentState!
                                .validate()) {
                              controller.login(context, controller.phone.text,
                                  controller.pass.text);
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
                                  style: ThemeText.heading2Style
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
                              controller.googleSignIn(context);
                            },
                            label: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Sign up with Google',
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
                              width: 28,
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
                                style: ThemeText.heading2Style
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(Routes.signup),
                              child: Text(
                                'Signup',
                                  style: ThemeText.BlueMinHeading
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
