import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/addguard/controller/addguard_controller.dart';

class AddGuardView extends GetView<AddGuardController> {
  const AddGuardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Get.toNamed(Routes.admindash),
          icon: const Icon(Icons.arrow_back),
          color: Colors.black54,
        ),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              height: Get.height * 0.85,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Column(
                    children: [
                      CircleAvatar(
                        radius: Get.height * 0.05,
                        backgroundColor: Colors.indigo.shade100,
                        backgroundImage:
                            const AssetImage('assets/images/guard.png'),
                      ),
                      Text(
                        "Add new employee",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.normal,
                            fontFamily: CustomFonts.alata),
                      ),
                    ],
                  )),
                  SizedBox(
                    height: Get.height * 0.65,
                    child: Form(
                        key: Validation.guardFormKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextFormField(
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Enter name',
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Name required'),
                                PatternValidator(
                                    RegExp(r'^[a-z A-Z]+$').pattern,
                                    errorText: 'Invalid name')
                              ]),
                              onChanged: (value) => controller.name = value,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Enter email',
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: MultiValidator([
                                RequiredValidator(errorText: 'Email required'),
                                PatternValidator(
                                    RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                        .pattern,
                                    errorText: 'Invalid email')
                              ]),
                              onChanged: (value) => controller.email = value,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 10,
                              style: const TextStyle(color: Colors.black54),
                              decoration: InputDecoration(
                                  counterText: '',
                                  filled: true,
                                  hintStyle:
                                      const TextStyle(color: Colors.black54),
                                  hintText: 'Enter Phone Number ',
                                  contentPadding: EdgeInsets.zero,
                                  prefixIcon: const Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Phone number required'),
                                PatternValidator(RegExp(r'^[0-9]{10}$').pattern,
                                    errorText: 'Invalid number')
                              ]),
                              onChanged: (value) => controller.phone = value,
                            ),
                            Obx(() => TextFormField(
                                  style: const TextStyle(color: Colors.black54),
                                  obscureText: controller.isPass.value,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Colors.black54),
                                      hintText: 'Enter Password',
                                      contentPadding: EdgeInsets.zero,
                                      suffixIcon: IconButton(
                                          onPressed: () =>
                                              controller.showPass(),
                                          icon: controller.isPass.value
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility)),
                                      prefixIcon: const Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  validator: MultiValidator([
                                    MinLengthValidator(6,
                                        errorText:
                                            'password must be at least 6 digits long'),
                                    RequiredValidator(
                                        errorText: 'Password requied'),
                                    PatternValidator(
                                        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                                            .pattern,
                                        errorText:
                                            "Password doesn't match the format : Abc@123")
                                  ]),
                                  onChanged: (value) =>
                                      controller.password = value,
                                )),
                            Obx(() => TextFormField(
                                  style: const TextStyle(color: Colors.black54),
                                  obscureText: controller.isConfirmPass.value,
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Colors.black54),
                                      hintText: 'Confirm Password',
                                      contentPadding: EdgeInsets.zero,
                                      suffixIcon: IconButton(
                                          onPressed: () =>
                                              controller.showConfirmPass(),
                                          icon: controller.isConfirmPass.value
                                              ? const Icon(Icons.visibility_off)
                                              : const Icon(Icons.visibility)),
                                      prefixIcon: const Icon(Icons.lock),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                            CustomButton(
                              title: 'Save',
                              onPress: () {
                                controller.addGuard(context);
                              },
                            ),
                          ],
                        )),
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
