import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/components/customscroll.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/global/globalfunction.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/signup/controller/signup_controller.dart';

class SignupView extends GetView <SignupController>{
  const SignupView({super.key});

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
        child: SingleChildScrollView(
          
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal:12),
            height: Get.height*0.75,
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
                          fontSize:28,
                          fontWeight: FontWeight.normal,
                          fontFamily: CustomFonts.alata),
                    ),
                    Text(
                      "create an account to UBIVisit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize:15,
                          fontFamily: CustomFonts.alata),
                    ),
                  ],
                )),
                
                SizedBox(
                  height: Get.height * 0.65,
                  child: Form(
                    key: GlobalFunction.formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        style: const TextStyle(color: Colors.black54),
                        validator: (value) => GlobalFunction.isValid(value, 'Enter name'),
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                          
                      )),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(color: Colors.black54),
                        validator: (value) => GlobalFunction.isValid(value, 'Enter email'),
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter email',
                            prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                                    
                                    ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        style: const TextStyle(color: Colors.black54),
                        validator: (value) => GlobalFunction.isValid(value, 'Enter phone'),
                        decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter phone ',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black54),
                        validator: (value) => GlobalFunction.isValid(value, 'Enter password'),
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter Password',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                      TextFormField(
                        style: const TextStyle(color: Colors.black54),
                        validator: (value) =>GlobalFunction.isValid(value, 'Enter password'),
                        obscureText: true,
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Confirm Password',
                            prefixIcon: const Icon(Icons.lock),
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                      CustomButton(
                        title: 'Signup',
                        onPress: () {
                         if(GlobalFunction.formValid()){
                           print("fyy");
                           // GlobalFunction.CheckConnection();
                         }

                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.w500,
                                fontFamily: CustomFonts.alata,
                                color: Colors.black54),
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.login),
                            child: Text(
                              'Login here ',
                              style: TextStyle(
                                  fontSize: 17,
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
    );
  }
}
