import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginView extends GetView<LoginController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Container(
            child: Column(
              children: [
                Image.asset("assets/images/login.png",
                width: 230,
                height: 230,),
                Form(
                  child: Column(
                    children: [
                      Text("Welcome Back!!!",style: TextStyle(color:Colors.black87,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),),
                      Text("Login in to your existant account",style: TextStyle(fontSize: 15,),),
                      SizedBox(height: 18,),
                      Container(
                        margin: EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Enter Email ID/Phone Number ",
                            border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: "Enter Password ",
                            border:OutlineInputBorder(
                              borderRadius:BorderRadius.circular(20),
                            ),
                          ),

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forgot Password?",style:TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,fontSize:15
                          ),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: const Text('LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                            ),)),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("or connnect using ",style:TextStyle(
                              color: Colors.black54,
                          ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10,),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade400,
                            minimumSize: const Size.fromHeight(50),
                            shape: StadiumBorder(),
                            side:
                            BorderSide(width: 1.0, color: Colors.grey.shade400), // NEW
                          ),
                          onPressed: () {

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google.png',
                                width: 35,
                                height: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Google',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.indigo,),
                              ),
                              SizedBox(
                                height: 20,
                              ),

                            ],

                          )),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ",style:TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                          ),
                          ),
                          Text("Signup",style:TextStyle(
                            color: Colors.indigo,
                            fontSize: 20,
                          ),),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
