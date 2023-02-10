import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/components/customtextform.dart';
import 'package:ubivisit/core/components/passwordfield.dart';
import 'package:ubivisit/core/global/text_style.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/features/addguard/controller/addguard_controller.dart';


class AddGuardView extends GetView<AddGuardController> {
  const AddGuardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
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
                        style: ThemeText.headingBlack
                      )
                    ],
                  )),
                  SizedBox(
                    height: Get.height * 0.6,
                    child: Form(
                        key: Validation.guardFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextFormField(
                              hintText: 'Enter Name',
                              icon: const Icon(Icons.person),
                              onchanged: (value) => controller.name = value,
                               validator: (value){
                                 return  Validation.nameValidator(value);
                               }
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Email',
                              icon: const Icon(Icons.email),
                              inputType: TextInputType.emailAddress,
                              onchanged: (value) => controller.email = value,
                               validator: (value){
                                 return  Validation.emailValidator(value);
                               }
                            ),
                            CustomTextFormField(
                              hintText: 'Enter Phone Number',
                              icon: const Icon(Icons.phone),
                                inputType: TextInputType.number,
                              maxLength: 10,
                              onchanged: (value) => controller.phone = value,
                               validator: (value){
                                 return  Validation.phoneValidator(value);
                               }
                            ),
                            PasswordField(
                              onchanged: (value) => controller.password = value,
                               validator:(value){
                                 return  Validation.passwordValidator(value);
                               }
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
