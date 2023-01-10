import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/features/forgot/controller/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * 0.8,
            margin: const EdgeInsets.all(12),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black54,
                      )),
                  Image.asset(
                    'assets/images/forgot.png',
                    height: Get.height * 0.3,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Forgot Password ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:30,
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
                  TextFormField(
                    style: const TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black54),
                        hintText: 'Enter email address',
                        prefixIcon: const Icon(Icons.email),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: GlobalColor.customColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.grey))),
                  ),
                  CustomButton(
                    title: 'Reset Password',
                    onPress: () {},
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
