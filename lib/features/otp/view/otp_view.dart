import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:visitantapp/components/custombutton.dart';
import 'package:visitantapp/features/otp/controller/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: Stack(
          children: [
            Container(
              width: Get.width,
              color: Colors.indigo,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    'assets/images/password.png',
                    width: 150,
                    height: 80,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'OTP Verification',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.alata().fontFamily),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Please enter the OTP send to your mobile number',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
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
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '+91 1234567890',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Pinput(
                        length: 6,
                        pinAnimationType: PinAnimationType.fade,
                        defaultPinTheme: controller.defaultPinTheme,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Didn't recieve an OTP",
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Resend OTP',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          )),
                          const SizedBox(height: 10,),
                      CustomButton(
                        title: 'Verify',
                        onpress: () {},
                      )
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
