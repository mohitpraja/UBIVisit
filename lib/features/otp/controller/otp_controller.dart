import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/features/signup/controller/signup_controller.dart';

class OtpController extends GetxController {
  SignupController signupController = Get.find();

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
                child: TextFormField(
                  autofocus: true,
                  onChanged: (value) => updatePhone = value,
                  initialValue: signupData[2].toString(),
                  style: TextStyle(
                      fontFamily: CustomFonts.alata,
                      fontSize: 17,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                    hintText: 'Enter phone number',
                  ),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Phone requied'),
                    PatternValidator(RegExp(r'^[0-9]{10}$').pattern,
                        errorText: 'Invalid number')
                  ]),
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
}
