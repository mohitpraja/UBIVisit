import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Obx(() => TextFormField(
                              style: const TextStyle(color: Colors.black54),
                              obscureText: controller.isPass.value,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Enter New Password',
                                  
                                  suffixIcon: IconButton(
                                      onPressed: () => controller.showPass(),
                                      icon: controller.isPass.value
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility)),
                                  prefixIcon: const Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: MultiValidator([
                                MinLengthValidator(6,
                                    errorText:
                                        'Password must be at least 6 digits long'),
                                RequiredValidator(
                                    errorText: 'Password requied'),
                                PatternValidator(
                                    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                                        .pattern,
                                    errorText:
                                        "Password doesn't match the format : Abc@123")
                              ]),
                              onChanged: (value) => controller.password = value,
                            )),
                        SizedBox(
                          height: Get.height * 0.035,
                        ),
                        Obx(() => TextFormField(
                              style: const TextStyle(color: Colors.black54),
                              obscureText: controller.isConfirmPass.value,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.zero,
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Confirm New Password',
                                  suffixIcon: IconButton(
                                      onPressed: () =>
                                          controller.showConfirmPass(),
                                      icon: controller.isConfirmPass.value
                                          ? const Icon(Icons.visibility_off)
                                          : const Icon(Icons.visibility)),
                                  prefixIcon: const Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Confirm Password required';
                                }
                                if (value != controller.password) {
                                  return 'Password Do Not Match';
                                }
                                return null;
                              },
                            )),
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
