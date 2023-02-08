import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/components/customtextform.dart';
import 'package:ubivisit/core/components/passwordfield.dart';
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
      appBar: Customeappbar(
          color: Colors.transparent,
          colors: Colors.black,
          onPress: (){Get.back();}
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
                        "Add new Guard",
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
                    height: Get.height * 0.7,
                    child: Form(
                        key: Validation.guardFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextFormField(
                              hintText: 'Enter Name',
                              icon: const Icon(Icons.person),
                              onchanged: (value) => controller.name = value,
                               validator: Validation.nameValidator,
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Email',
                              icon: const Icon(Icons.email),
                              inputType: TextInputType.emailAddress,
                              onchanged: (value) => controller.email = value,
                               validator: Validation.emailValidator,
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Phone Number',
                              icon: const Icon(Icons.phone),
                              maxLength: 10,
                              onchanged: (value) => controller.phone = value,
                               validator: Validation.phoneValidator,
                            ),
                            PasswordField(
                              onchanged: (value) => controller.password = value,
                               validator: Validation.passwordValidator,
                            ),
                            PasswordField(
                              hintext: 'Confirm Password',
                              validator: (value) =>Validation.confirmValidator(value,controller.password) ,
                            ),
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
