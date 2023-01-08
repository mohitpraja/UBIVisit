import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:visitantapp/components/custombutton.dart';
import 'package:visitantapp/core/customfont.dart';
import 'package:visitantapp/core/global.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black54,
                ),
                Image.asset(
                  "assets/images/login.png",
                  width: 280,
                ),
                Form(
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back!!!",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontFamily: CustomFonts.alata),
                      ),
                      Text(
                        "Login in to your existant account",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            fontFamily: CustomFonts.alata),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.person),
                            filled: true,
                            hintText: 'Phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 22),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            filled: true,
                            hintText: "Enter Password ",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed(Routes.forgot),
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: GloabalColor.customColor,
                                  fontFamily: GoogleFonts.alata().fontFamily,
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                        title: "Login",
                        onpress: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "or connnect using ",
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: Get.width,
                        height: 44,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text(
                            'Google',
                            style: TextStyle(fontSize: 16),
                          ),
                          icon: Image.asset(
                            'assets/images/google.png',
                            width: 25,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.signup),
                            child: const Text(
                              'Signup',
                              style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
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
