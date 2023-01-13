import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/components/customscroll.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/global/validation.dart';
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
        child: ScrollConfiguration(
          behavior: CustomScroll(),
          child: SingleChildScrollView(
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
                        key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                            
                        ),

                          validator: (value){
                            if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)){
                              return 'Enter Correct Name';

                            }else {
                              return null;
                            }



                          },





                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter email',
                              prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                                      
                                      ),
                          validator: (value){
                            if (value!.isEmpty || !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value)){
                              return 'Enter Correct Email';

                            }else {
                              return null;
                            }



                          },




                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          style: const TextStyle(color: Colors.black54),
                          decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter Phone Number ',
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

                          validator: (value){
                            if (value!.isEmpty || !RegExp(r'^[0-9]{10}$').hasMatch(value)){
                              return 'Enter Correct Phone Number';

                            }else {
                              return null;
                            }



                          },






                        ),
                        TextFormField(
                          controller: controller.Password,
                          style: const TextStyle(color: Colors.black54),
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(Icons.lock),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

                          validator: (value){
                            if (value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)){
                              return 'Enter Correct Password';

                            }else {
                              return null;
                            }



                          },





                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.black54),
                          controller:controller. confirmPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              hintStyle: const TextStyle(color: Colors.black54),
                              hintText: 'Confirm Password',
                              prefixIcon: const Icon(Icons.lock),
                               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),

                          validator: (value){
                            if(value!.isEmpty)
                              return 'Enter Correct Password';
                            if(value!= controller.Password.text)
                              return 'Password Do Not Match';
                            return null;



                          },




                        ),
                        CustomButton(
                          title: 'Signup',
                          onPress: () {

                            controller.signupButton();
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
      ),
    );
  }
}
