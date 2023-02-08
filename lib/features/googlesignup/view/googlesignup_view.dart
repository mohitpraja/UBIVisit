import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/googlesignup/controller/googlesignup_controller.dart';

class GoogleSignupView extends GetView<GoogleSignupController> {
  const GoogleSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:
        Customeappbar(
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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: Get.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            fontSize: 28,
                            fontWeight: FontWeight.normal,
                            fontFamily: CustomFonts.alata),
                      ),
                      Text(
                        "create an account to UBIVisit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: CustomFonts.alata),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: Get.height * 0.7,
                    child: Form(
                        key: Validation.googleSignupFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Enter name',
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Name required'),
                                PatternValidator(
                                    RegExp(r'^[a-z A-Z]+$').pattern,
                                    errorText: 'Invalid name')
                              ]),
                              onChanged: (value) => controller.name = value,
                            ),
                            TextFormField(
                              readOnly: true,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Enter email',
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Email required'),
                                PatternValidator(
                                    RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .pattern,
                                    errorText: 'Invalid email')
                              ]),
                              initialValue: controller.signupEmail,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                  counterText: '',
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Enter Phone Number ',
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Phone number required'),
                                PatternValidator(RegExp(r'^[0-9]{10}$').pattern,
                                    errorText: 'Invalid number')
                              ]),
                              onChanged: (value) => controller.phone = value,
                            ),
                           
                            Obx(() => TextFormField(
                                  style: const TextStyle(color: Colors.black54),
                                  obscureText: controller.isPass.value,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Colors.black54),
                                      hintText: 'Enter Password',
                                      contentPadding: EdgeInsets.zero,
                                      suffixIcon: IconButton(
                                          onPressed: () =>
                                              controller.showPass(),
                                          icon: controller.isPass.value
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility)),
                                      prefixIcon: const Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Password requied'),
                                    PatternValidator(
                                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                                            .pattern,
                                        errorText:
                                            "Password doesn't match the format : Abc@123")
                                  ]),
                                  onChanged: (value) =>
                                      controller.password = value,
                                )),
                            Obx(() => TextFormField(
                                  style: const TextStyle(color: Colors.black54),
                                  obscureText: controller.isConfirmPass.value,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Colors.black54),
                                      hintText: 'Confirm Password',
                                      contentPadding: EdgeInsets.zero,
                                      suffixIcon: IconButton(
                                          onPressed: () =>
                                              controller.showConfirmPass(),
                                          icon: controller.isConfirmPass.value
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility)),
                                      prefixIcon: const Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Confirm Password required';
                                    }
                                    if (value != controller.password) {
                                      return 'Password Do Not Match';
                                    }
                                    return null;
                                  },
                                )),
                            CustomButton(
                              title: 'Signup',
                              onPress: () {
                                if (Validation.googleSignupFormKey.currentState!
                                    .validate()) {
                                  controller.signupByGoogle(context);
                                }
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                      fontSize: 16,
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
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
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
