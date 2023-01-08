import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/components/custombutton.dart';
import 'package:visitantapp/core/customfont.dart';
import 'package:visitantapp/core/global.dart';
import 'package:visitantapp/core/routes.dart';

class SignupView extends GetView {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black54,
                ),
                Center(
                    child: Column(
                  children: [
                    Text(
                      "Let's Get Started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 23,
                          fontFamily: CustomFonts.alata),
                    ),
                    Text(
                      "create an account to UBIVisit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: CustomFonts.alata),
                    ),
                  ],
                )),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: Get.height * 0.65,
                  child: Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter name',
                            prefixIcon: const Icon(Icons.person),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: GloabalColor.customColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter email',
                            prefixIcon: const Icon(Icons.email),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: GloabalColor.customColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        style: const TextStyle(color: Colors.black54),
                        decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter phone ',
                            prefixIcon: const Icon(Icons.phone),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: GloabalColor.customColor),
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
                                  BorderSide(color: GloabalColor.customColor),
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
                            hintText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: GloabalColor.customColor),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide:
                                    const BorderSide(color: Colors.grey))),
                      ),
                      CustomButton(
                        title: 'Signup',
                        onpress: () {},
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
                            onTap: () => Get.toNamed(Routes.login),
                            child: Text(
                              'Login here ',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: CustomFonts.alata,
                                  color: GloabalColor.customColor),
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
    );
  }
}
