import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/forgot/controller/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar:AppBar(
        elevation: 0,
        titleSpacing: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Get.toNamed(Routes.login), icon: const Icon(Icons.arrow_back),color: Colors.black54,),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
            child: Container(
              height: Get.height * 0.75,
              margin: const EdgeInsets.all(12),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'assets/images/forgot.png',
                      height: Get.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Text(
                          'Forgot Password ?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: Get.height*0.035,
                              fontFamily: CustomFonts.alata,
                              color: Colors.black54),
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Text(
                          'Enter your phone number to retrieve your password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: Get.height*0.02,
                              fontFamily: CustomFonts.alata,
                              color: Colors.black45),
                        ),
                      ],
                    ),
                    Form(
                      key: Validation.forgotFormKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          style: const TextStyle(color: Colors.black54),
                          maxLength: 10,
                          controller: controller.phone,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Phone number',
                              counterText: '',
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: 'Required Phone Number'),
                              PatternValidator(RegExp(r'^[0-9]{10}$').pattern,
                                  errorText: 'Please enter valid Phone Number')
                            ],
                          ),
                        ),
                    ),
                    CustomButton(
                      title: 'Reset Password',
                      onPress: () {
                        if(Validation.forgotFormKey.currentState!.validate()){
                          controller.resetPassword(context);

                        }
                       
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
