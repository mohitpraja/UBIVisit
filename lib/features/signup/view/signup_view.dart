import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
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
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.login),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black54,
        ),
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
                              hintText: 'Enter Name',
                              icon: const Icon(Icons.person),
                              onchanged: (value) => controller.name = value,
                              validator: Validation.nameValidator,
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Email',
                              inputType: TextInputType.emailAddress,
                              icon: const Icon(Icons.email),
                              onchanged: (value) => controller.email = value,
                              validator: Validation.emailValidator,
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Phone Number',
                              inputType: TextInputType.number,
                              icon: const Icon(Icons.phone),
                              onchanged: (value) => controller.phone = value,
                              maxLength: 10,
                              validator: Validation.phoneValidator,
                            ),
                            PasswordField(
                              onchanged: (value) => controller.password = value,
                              validator: Validation.passwordValidator,
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
