import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/features/otp/controller/otp_controller.dart';

import '../../../core/global/text_style.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPress: () {
          Get.back();
        },
      ),


      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Stack(
          children: [
            Positioned(
              top: -.1,
              child: Container(
                width: Get.width,
                height: Get.height,
                color: GlobalColor.customColor,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/password.png',
                      height: Get.height * 0.12,
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    Text(
                      'OTP Verification',
                        style: ThemeText.headingWhite
                    ),
                    SizedBox(
                      height: Get.height * 0.002,
                    ),
                    Text(
                      'Please enter the OTP send to your mobile number',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Get.height * 0.018,
                          fontWeight: FontWeight.w500,
                          fontFamily: CustomFonts.alata),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: Get.width,
                height: Get.height * 0.6,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black87,
                        blurRadius: 20.0,
                        offset: Offset(3.0, 3.0))
                  ],
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: Get.height * 0.4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Obx(() => Text(
                                      controller.forrebuilt.value == 'ram'
                                          ? ''
                                          : '+91 ${controller.signupData[2]}',
                                    style: ThemeText.userHeading
                                    )),
                                IconButton(
                                  onPressed: () {
                                    controller.showBottomSheet(context);
                                  },
                                  icon: const Icon(Icons.edit),
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            Pinput(
                              length: 6,
                              pinAnimationType: PinAnimationType.fade,
                              defaultPinTheme: controller.defaultPinTheme,
                              onChanged: (value) => controller.otp = value,
                            ),
                            Text(
                              "Didn't receive an OTP",
                                style: ThemeText.heading2Style
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Resend OTP',
                                    style: ThemeText.blueMinHeading
                                )),
                            CustomButton(
                              title: 'Verify',
                              onPress: () {
                                controller.signupController
                                    .verifyOTP(controller.otp, context);
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
