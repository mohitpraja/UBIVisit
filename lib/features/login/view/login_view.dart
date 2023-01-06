import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visitantapp/components/custombutton.dart';
import 'package:visitantapp/features/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                Image.asset(
                  "assets/images/login.png",
                  width: 230,
                  height: 230,
                ),
                Form(
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back!!!",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 25,
                            fontFamily: GoogleFonts.alata().fontFamily),
                      ),
                      Text(
                        "Login in to your existant account",
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: GoogleFonts.alata().fontFamily),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            filled: true,
                            labelText: "Phone Number ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open),
                            filled: true,
                            labelText: "Enter Password ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontFamily: GoogleFonts.alata().fontFamily,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        title: "Login",
                        onpress: () {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "or connnect using ",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 44,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: Text(
                            'Google',
                            style: TextStyle(fontSize: 16),
                          ),
                          icon: Image.asset(
                            'assets/images/google.png',
                            width: 25,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          Text('Signup',style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 17,
                            fontWeight:FontWeight.w500
                          ),)

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
