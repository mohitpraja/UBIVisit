import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/components/customtextform.dart';
import 'package:ubivisit/core/components/passwordfield.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/signup/controller/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
      CustomAppbar(
        colors: Colors.black,
        color: Colors.white,
        onPress: () {
          Get.toNamed(Routes.login);

        },
      ),

      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: Get.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Column(
                    children: [
                      Text(
                        "Let's Get Started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.height * 0.04,
                            fontWeight: FontWeight.normal,
                            fontFamily: CustomFonts.alata),
                      ),
                      Text(
                        "create an account to UBIVisit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Get.height * 0.02,
                            fontFamily: CustomFonts.alata),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: Get.height * 0.65,
                    child: Form(
                        key: Validation.signupFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextFormField(
                              hintText: 'Enter Organization Name',
                              icon: const Icon(Icons.location_city_rounded),
                              onchanged: (value) => controller.organization = value,
                              validator: (value){
                                return  Validation.nameValidator(value);
                              },
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Name',
                              icon: const Icon(Icons.person),
                              onchanged: (value) => controller.name = value,
                              validator: (value){
                                return  Validation.nameValidator(value);
                              },
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Email',
                              inputType: TextInputType.emailAddress,
                              icon: const Icon(Icons.email),
                              onchanged: (value) => controller.email = value,
                              validator: (value){
                                return  Validation.emailValidator(value);
                              },
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Phone Number',
                              inputType: TextInputType.number,
                              icon: const Icon(Icons.phone),
                              onchanged: (value) => controller.phone = value,
                              maxLength: 10,
                              validator:(value){
                                return  Validation.phoneValidator(value);
                              },
                            ),
                            PasswordField(
                              onchanged: (value) => controller.password = value,
                              validator: (value){
                                return  Validation.passwordValidator(value);
                              },
                            ),
                            PasswordField(
                              hintext: 'Confirm Password',
                              validator: (value) => Validation.confirmValidator(
                                  value, controller.password),
                            ),
                            CustomButton(
                              title: 'Signup',
                              onPress: () {
                                controller.gotoOtp(context);
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                      fontSize: Get.height * 0.02,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: CustomFonts.alata,
                                      color: Colors.black54),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.login);
                                  },
                                  child: Text(
                                    'Login here ',
                                    style: TextStyle(
                                        fontSize: Get.height * 0.021,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: CustomFonts.alata,
                                        color: GlobalColor.customColor),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
