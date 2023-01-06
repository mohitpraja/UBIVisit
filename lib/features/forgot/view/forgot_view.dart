import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:visitantapp/components/custombutton.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/forgot/controller/forgot_controller.dart';

class ForgotView extends GetView<ForgotController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(12),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  IconButton(onPressed:() =>Get.toNamed(Routes.forgot) , icon:Icon(Icons.arrow_back,color: Colors.black54,size: 30,)),
                  SizedBox(height: 50,),
                  Container(
                    height: 250,
                    width: 300,
                    decoration: BoxDecoration(
                        image:DecorationImage(
                            image:AssetImage('assets/images/forgot.png'),fit: BoxFit.cover)),
                  ),

                  Padding(padding:EdgeInsets.only(top: 40)),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('Forgot Your Password ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black54),),
                   SizedBox(height: 20,),
                   Text('Enter your email address to retrieve your password',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color:Colors.black45),),

                 ],
               ),
                  Padding(padding:EdgeInsets.only(top: 40)),
                  Container(
                      height: 50,
                      width: 350,

                      child: TextFormField(
                        decoration: InputDecoration(filled: true,
                            prefixIcon:Icon(Icons.email),
                            hintText: 'Enter email address',

                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),borderSide:BorderSide(color: Colors.grey)),

                        ),


                      )),
                  Padding(padding:EdgeInsets.only(top: 40)),
                  CustomButton(
                    title: 'Reset Password',
                    onpress: () {},
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