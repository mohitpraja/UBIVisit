import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/global/validation.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/securityguard/controller/security_guard_controller.dart';

class SecurityGuardView extends GetView <SecurityGuardController>{
  const SecurityGuardView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: () => Get.toNamed(Routes.login), icon: const Icon(Icons.arrow_back),color: GlobalColor.customColor,),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [

              Image.asset(
                "assets/images/addemployee.png",
                height: 50,
                width: 60,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add Security Guard",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: GlobalColor.customColor,
                        fontSize:20,
                        fontWeight: FontWeight.bold,
                        fontFamily: CustomFonts.alata),
                  ),
                ],
              ),
              SizedBox(height: 20,),
                 Form(
                   key: Validation.guardFormKey,
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Container(
                       width: size.width*0.9,
                       margin: EdgeInsets.symmetric(vertical: 6),
                       child:  TextFormField(
                           keyboardType: TextInputType.name,
                           style: const TextStyle(color: Colors.black54),
                           validator: (value) => Validation.isValid(value, 'Enter name'),
                           decoration: InputDecoration(
                             filled: true,
                             hintStyle: const TextStyle(color: Colors.black54),
                             hintText: 'Enter name',
                             prefixIcon: const Icon(Icons.person),
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

                           )),

                     ),
                     Container(
                       width: size.width*0.9,
                       margin: EdgeInsets.symmetric(vertical: 6),
                       child:   TextFormField(
                         keyboardType: TextInputType.emailAddress,
                         style: const TextStyle(color: Colors.black54),
                         validator: (value) => Validation.isValid(value, 'Enter email'),
                         decoration: InputDecoration(
                             filled: true,
                             hintStyle: const TextStyle(color: Colors.black54),
                             hintText: 'Enter email',
                             prefixIcon: const Icon(Icons.email),
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                         ),
                       ),
                     ),
                     Container(
                       width: size.width*0.9,
                       margin: EdgeInsets.symmetric(vertical: 6),
                       child:   TextFormField(
                         keyboardType: TextInputType.number,
                         maxLength: 10,
                         style: const TextStyle(color: Colors.black54),
                         validator: (value) => Validation.isValid(value, 'Enter phone'),
                         decoration: InputDecoration(
                             counterText: '',
                             filled: true,
                             hintStyle: const TextStyle(color: Colors.black54),
                             hintText: 'Enter phone ',
                             prefixIcon: const Icon(Icons.phone),
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                       ),
                     ),
                     Container(
                       width: size.width*0.9,
                       margin: EdgeInsets.symmetric(vertical: 6),
                       child:    TextFormField(
                         style: const TextStyle(color: Colors.black54),
                         keyboardType: TextInputType.visiblePassword,
                         validator: (value) => Validation.isValid(value, 'Enter password'),
                         obscureText: true,
                         decoration: InputDecoration(
                             filled: true,
                             hintStyle: const TextStyle(color: Colors.black54),
                             hintText: 'Enter Password',
                             prefixIcon: const Icon(Icons.lock),
                           suffixIcon: IconButton(onPressed: () {},icon: Icon(Icons.visibility,)),
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                       ),
                     ),
                     Container(
                       width: size.width*0.9,
                       margin: EdgeInsets.symmetric(vertical: 6),
                       child:  TextFormField(
                         keyboardType: TextInputType.visiblePassword,
                         style: const TextStyle(color: Colors.black54),
                         validator: (value) =>Validation.isValid(value, 'Enter password'),
                         obscureText: true,
                         decoration: InputDecoration(
                             filled: true,
                             hintStyle: const TextStyle(color: Colors.black54),
                             hintText: 'Confirm Password',
                             prefixIcon: const Icon(Icons.lock),
                             suffixIcon: IconButton(onPressed: () {},icon: Icon(Icons.visibility,)),
                             border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                       ),
                     ),

                     Container(
                       width: size.width*0.8,
                       margin: EdgeInsets.only(top: 10),

                       child: ClipRRect(

                         child: CustomButton(
                           title: 'Save',
                           onPress: () {

                           },
                         ),
                       ),
                     ),


                           ],
                 ),

          ),


  ]
          ),
        ),
      ),
    );
  }
}
