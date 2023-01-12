import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/components/customscroll.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/validation.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/forgot/controller/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:AppBar(
        elevation: 0,
        titleSpacing: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Get.toNamed(Routes.login), icon: const Icon(Icons.arrow_back),color: Colors.black54,),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              height: Get.height * 0.7,
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: CustomFonts.alata,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          'Enter your email address to retrieve your password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              fontFamily: CustomFonts.alata,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                    Form(
                      key: Validation.forgotFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black54),
                        validator: (value) =>
                            Validation.isValid(value, 'Enter email'),
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter email address',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    CustomButton(
                      title: 'Reset Password',
                      onPress: () {
                       
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
