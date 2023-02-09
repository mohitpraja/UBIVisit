import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/components/underlinetextfield.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';

class ProfileOtpController extends GetxController {
  final defaultPinTheme = PinTheme(
    width: 42,
    height: 42,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: Colors.indigo),
    ),
  );

  var signupData = Get.arguments;
  final formkey = GlobalKey<FormState>();
  var updatePhone = '';
  var otp = '';
  RxString forrebuilt = ''.obs;
  showBottomSheet(context) {
    Get.bottomSheet(Container(
      color: Colors.white,
      child: Container(
          margin: const EdgeInsets.all(15),
          height: Get.height * 0.18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Enter phone number',
                style: TextStyle(
                    fontFamily: CustomFonts.alata,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Form(
                key: formkey,
                child: UnderLineTextField(
                  hintText: 'Enter Phone',
                  icon: const Icon(Icons.phone),
                  initialValue: signupData[2].toString(),
                  validator: (value) {
                    return Validation.phoneValidator(value);
                  },
                  onchanged: (value) => updatePhone = value,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        'cancel',
                        style: TextStyle(
                            fontFamily: CustomFonts.alata,
                            fontSize: 17,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500),
                      )),
                  TextButton(
                      onPressed: () {
                        forrebuilt.value = '';
                        if (formkey.currentState!.validate()) {
                          signupData[2] = updatePhone;
                        }
                        Get.back();
                        // signupData[2]=otpPhone.value;
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                            fontFamily: CustomFonts.alata,
                            fontSize: 17,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              )
            ],
          )),
    ));
  }

  verifyOtp(context) async {
    CustomLoader.showLoader(context);
    AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: signupData[1], smsCode: otp);
    try {
      final authCred =
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      if (authCred.user != null) {
        Get.back();
        FBase.updateUserInfo(context, 'phone', signupData[0], signupData[3], '')
            .then((value) {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.success,
                  title: 'Success',
                  dismissOnBackKeyPress: false,
                  dismissOnTouchOutside: false,
                  btnOkOnPress: () => Get.offAllNamed(Routes.editprofile),
                  desc: 'Phone number updated successfully')
              .show();
        });
      }
    } on FirebaseAuthException {
      Get.back();
      const CustomSnackbar(msg: 'Invalid OTP', title: 'Warning').show();
    }
  }
}
