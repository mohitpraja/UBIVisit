import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../../core/components/custombutton.dart';
import '../../../core/components/customscroll.dart';
import '../../../core/global/customfont.dart';
import '../../../core/global/validation.dart';
import '../../../core/routes.dart';
import '../controller/addemployee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 1,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.toNamed(Routes.login),
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
                            Image.asset(
                              "assets/images/addemployee.png",
                              height: 50,
                              width: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Add Employee",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 20,
                                  fontFamily: CustomFonts.alata),
                            ),
                          ],
                        )),
                        SizedBox(
                          height: Get.height * 0.7,
                          child: Form(
                            key: Validation.signupFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextFormField(
                                  style: const TextStyle(color: Colors.black54),
                                  decoration: InputDecoration(
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Colors.black54),
                                      hintText: 'Enter name',
                                      prefixIcon: const Icon(Icons.person),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Name required'),
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
                                      hintStyle: const TextStyle(
                                          color: Colors.black54),
                                      hintText: 'Enter email',
                                      prefixIcon: const Icon(Icons.email),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Email required'),
                                    PatternValidator(
                                        RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .pattern,
                                        errorText: 'Invalid email')
                                  ]),
                                  onChanged: (value) =>
                                      controller.email = value,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  style: const TextStyle(color: Colors.black54),
                                  decoration: InputDecoration(
                                      counterText: '',
                                      filled: true,
                                      hintStyle: const TextStyle(
                                          color: Colors.black54),
                                      hintText: 'Enter Phone Number ',
                                      prefixIcon: const Icon(Icons.phone),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Phone number required'),
                                    PatternValidator(
                                        RegExp(r'^[0-9]{10}$').pattern,
                                        errorText: 'Invalid number')
                                  ]),
                                  onChanged: (value) =>
                                      controller.phone = value,
                                ),
                                Obx(() => TextFormField(
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      obscureText: controller.isPass.value,
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintStyle: const TextStyle(
                                              color: Colors.black54),
                                          hintText: 'Enter Password',
                                          suffixIcon: IconButton(
                                              onPressed: () =>
                                                  controller.showPass(),
                                              icon: controller.isPass.value
                                                  ? const Icon(
                                                      Icons.visibility_off)
                                                  : const Icon(
                                                      Icons.visibility)),
                                          prefixIcon: const Icon(Icons.lock),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      validator: MultiValidator([
                                        MinLengthValidator(6,
                                            errorText:
                                                'password must be at least 8 digits long'),
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
                                      style: const TextStyle(
                                          color: Colors.black54),
                                      obscureText:
                                          controller.isConfirmPass.value,
                                      decoration: InputDecoration(
                                          filled: true,
                                          hintStyle: const TextStyle(
                                              color: Colors.black54),
                                          hintText: 'Confirm Password',
                                          suffixIcon: IconButton(
                                              onPressed: () =>
                                                  controller.showConfirmPass(),
                                              icon:
                                                  controller.isConfirmPass.value
                                                      ? const Icon(
                                                          Icons.visibility_off)
                                                      : const Icon(
                                                          Icons.visibility)),
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
                                Container(
                                  width: size.width * 0.8,
                                  margin: const EdgeInsets.only(top: 10),
                                  child: ClipRRect(
                                    child: CustomButton(
                                      title: 'Save',
                                      onPress: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            )));
  }
}
