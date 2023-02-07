import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/components/customtextform.dart';
import 'package:ubivisit/core/components/passwordfield.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/addemployee/controller/addemployee_controller.dart';

class AddEmployeeView extends GetView<AddEmployeeController> {
  const AddEmployeeView({super.key});

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
              height: Get.height * 0.9,
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
                            const AssetImage('assets/images/person.png'),
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
                    height: Get.height * 0.75,
                    child: Form(
                        key: Validation.employeeFormKey,
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
                            CustomTextFormField(
                              hintText: 'Role',
                              icon: const Icon(Icons.card_travel),
                              onchanged: (value) => controller.post = value,
                               validator: Validation.nameValidator,
                            ),
                            PasswordField(
                              onchanged: (value) => controller.password = value,
                               validator: Validation.passwordValidator,
                            ),
                            PasswordField(
                              hintext: 'Confirm Password',
                              validator: (value) => Validation.confirmValidator(value,controller.password),
                              
                            ),
                            CustomButton(
                              title: 'Save',
                              onPress: () {
                                controller.addEmployee(context);
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
