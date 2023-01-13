import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/components/custombutton.dart';
import '../../../core/global/customfont.dart';
import '../../../core/global/global.dart';
import '../../../core/global/globalfunction.dart';
import '../../../core/routes.dart';
import '../controller/security_guard_controller.dart';

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
                   key: GlobalFunction.formkey,
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
                           validator: (value) => GlobalFunction.isValid(value, 'Enter name'),
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
                         validator: (value) => GlobalFunction.isValid(value, 'Enter email'),
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
                         validator: (value) => GlobalFunction.isValid(value, 'Enter phone'),
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
                         validator: (value) => GlobalFunction.isValid(value, 'Enter password'),
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
                         validator: (value) =>GlobalFunction.isValid(value, 'Enter password'),
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
