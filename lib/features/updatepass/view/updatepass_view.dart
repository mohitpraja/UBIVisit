import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/components/passwordfield.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/features/updatepass/controller/updatepass_controller.dart';

class UpdatePass extends GetView<UpdatePassController> {
  const UpdatePass({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        body: ScrollConfiguration(
          behavior: CustomScroll(),
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'UBI',
                      style: TextStyle(
                          color: GlobalColor.customColor,
                          fontSize: Get.height * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Visit',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: Get.height * 0.04,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Text(
                  'reset your account password',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: Get.height * 0.02,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Form(
                    key: Validation.updatepassFormKey,
                    child: Column(
                      children: [
                        PasswordField(
                         
                          onchanged: (value) => controller.password = value,
                           validator: Validation.passwordValidator,
                        ),
                        SizedBox(
                          height: Get.height * 0.035,
                        ),
                        PasswordField(
                          hintext: 'Confirm Password',
                           validator: (value) => Validation.confirmValidator(value,controller.password),
                        ),
                        SizedBox(
                          height: Get.height * 0.035,
                        ),
                        CustomButton(
                          title: 'Reset Password',
                          onPress: () {
                            if (Validation.updatepassFormKey.currentState!
                                .validate()) {
                              controller.updatePassword(context);
                            }
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
