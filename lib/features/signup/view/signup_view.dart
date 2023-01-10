import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/customfont.dart';
import 'package:visitantapp/core/global.dart';
import 'package:visitantapp/core/routes.dart';

class SignupView extends GetView {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back),color: Colors.black54,),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal:12),
              height: Get.height*0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  Center(
                      child: Column(
                    children: [
                      Text(
                        "Let's Get Started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: Get.height*0.03,
                            fontFamily: CustomFonts.alata),
                      ),
                      Text(
                        "create an account to UBIVisit",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize:Get.height*0.02,
                            fontFamily: CustomFonts.alata),
                      ),
                    ],
                  )),
                  
                  SizedBox(
                    height: Get.height * 0.65,
                    child: Form(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter name',
                              prefixIcon: const Icon(Icons.person),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GlobalColor.customColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter email',
                              prefixIcon: const Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GlobalColor.customColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          style: const TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter phone ',
                              prefixIcon: const Icon(Icons.phone),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GlobalColor.customColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(Icons.lock),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GlobalColor.customColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Confirm Password',
                              prefixIcon: const Icon(Icons.lock),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: GlobalColor.customColor),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide:
                                      const BorderSide(color: Colors.grey))),
                        ),
                        CustomButton(
                          title: 'Signup',
                          onPress: () {
                            Get.toNamed(Routes.otp);
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? ',
                              style: TextStyle(
                                  fontSize:Get.height*0.02,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: CustomFonts.alata,
                                  color: Colors.black54),
                            ),
                            InkWell(
                              onTap: () => Get.toNamed(Routes.login),
                              child: Text(
                                'Login here ',
                                style: TextStyle(
                                    fontSize: Get.height*0.021,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: CustomFonts.alata,
                                    color: GlobalColor.customColor),
                              ),
                            ),
                          ],
                        )
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
