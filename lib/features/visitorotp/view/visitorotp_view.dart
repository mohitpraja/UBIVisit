import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/text_style.dart';
import 'package:ubivisit/features/visitorotp/controller/visitorotp_controller.dart';

class VisitorOtpView extends GetView<VisitorOtpController> {
  const VisitorOtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Stack(
          children: [
            Positioned(
              top: 0,
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
                      textAlign: TextAlign.center,
                      'Please enter the OTP send to your mobile number',
                      style: ThemeText.whiteMedHeading
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
                              "Didn't recieve an OTP",
                              style: ThemeText.heading2Style
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Resend OTP',
                                  style: ThemeText.BlueMinHeading
                                )),
                            CustomButton(
                              title: 'Verify',
                              onPress: () {
                                controller.verifyOtp(context);
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
