import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/components/customtextform.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/forgot/controller/forgot_controller.dart';

import '../../../core/global/text_style.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:
        CustomAppbar(
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
              height: Get.height * 0.75,
              margin: const EdgeInsets.all(12),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/forgot.png',
                      height: Get.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Text(
                          'Forgot Password ?',
                          textAlign: TextAlign.center,
                            style: ThemeText.userHeading
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          'Enter your phone number to retrieve your password',
                          textAlign: TextAlign.center,
                            style: ThemeText.heading2Style
                        ),
                      ],
                    ),
                    Form(
                      key: Validation.forgotFormKey,
                      child: CustomTextFormField(
                        hintText: 'Phone Number',
                        icon: const Icon(Icons.phone),
                          inputType: TextInputType.number,
                        maxLength: 10,
                        controller: controller.phone,
                        validator: (value){
                          return  Validation.phoneValidator(value);
                        }
                      ),
                    ),
                    CustomButton(
                      title: 'Reset Password',
                      onPress: () {
                        if (Validation.forgotFormKey.currentState!.validate()) {
                          controller.resetPassword(context);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
