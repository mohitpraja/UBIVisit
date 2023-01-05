import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:visitantapp/core/routes.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool _obsecureText = true;


    @override
    Widget build(BuildContext context) {
      return Scaffold(


        body:Center(
        child: SingleChildScrollView(

        child: Column(
          children: [
            const SizedBox(
              height: 1,
            ),
        Container(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              IconButton(onPressed: (){
                Get.toNamed(RoutesConstant.signup);
              }, icon: Icon(Icons.arrow_back,size: 40,)),
            ],
          ),
        ),
          const SizedBox(
            height: 1,
          ),
        SafeArea(
            child: SingleChildScrollView
              (child:
            Padding(padding:  EdgeInsets.symmetric(vertical:10,horizontal: 20),
              child: Column(
                children: [
                  Container(
                    alignment:Alignment.center,
                    child: const Text("Let's Get Started",
                      style: TextStyle(fontSize: 28, color: Colors.black,fontWeight: FontWeight.bold),

                    ),
                  ),
                  const SizedBox(height: 5,),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  const[
                        Text("Creat an account to UBIVisitor",
                          style: TextStyle(fontSize: 20,color:Colors.black),
                        ),
                      ]
                  ),
                  const SizedBox(height: 40,),
                  TextFormField(
                    decoration:
                    InputDecoration(filled: true,
                      fillColor: Colors.indigo.shade100,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Enter Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 25,),
                  TextFormField(
                    decoration:
                    InputDecoration(filled: true,
                      fillColor: Colors.indigo.shade100,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Enter Email",
                      prefixIcon: Icon(Icons.email),


                    ),

                  ),

                  const SizedBox(height: 25,),
                  TextFormField(
                    decoration:
                    InputDecoration(filled: true,
                      fillColor: Colors.indigo.shade100,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "Enter Phone ",
                      prefixIcon: Icon(Icons.phone),
                    ),
                  ),

                  const SizedBox(height: 25,),
                  TextFormField(
                    obscureText: _obsecureText,
                    decoration:
                    InputDecoration(filled: true,
                        fillColor:Colors.indigo.shade100,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        hintText: "Enter Password",
                      prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                _obsecureText =! _obsecureText;
                              });
                            }, icon: Icon(_obsecureText? Icons.visibility: Icons.visibility_off),),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  TextFormField(  obscureText: _obsecureText,
                    decoration:
                    InputDecoration(filled: true,
                        fillColor: Colors.indigo.shade100,
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock),
                       suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            _obsecureText =! _obsecureText;
                          });
                        }, icon: Icon(_obsecureText? Icons.visibility: Icons.visibility_off),),


                    ),
                  ),
                  const SizedBox(
                    height: 30,

                  ),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),),
                        padding: MaterialStateProperty.all
                          (EdgeInsets.symmetric(vertical: 15, horizontal: 140,),),
                        backgroundColor: MaterialStateProperty.all(Colors.indigo),
                      ),
                      onPressed: (){

                      },
                      child: Text("Create",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                          color:Colors.white, ),),
                    ),
                  ),


                  const SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const[
                      Text("Already have an account? ",
                        style: TextStyle(fontSize: 18,color: Colors.grey),
                      ),
                      Text("Login here",
                        style: TextStyle(fontSize: 18,color: Colors.indigo),
                      ),

                    ],
                  )

                ],

              ),
            ),
            )
        ),

      ],
        ),
      ),
        ),

      );

    }
  }



