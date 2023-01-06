import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/components/custombutton.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/forgot/controller/forgot_controller.dart';

class ForgotView extends GetView<ForgotController> {
  const ForgotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(12),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  IconButton(
                      onPressed: () => Get.toNamed(Routes.forgot),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black54,
                        size: 30,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 250,
                    width: 300,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/forgot.png'),
                            fit: BoxFit.cover)),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Forgot Your Password ?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black54),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Enter your email address to retrieve your password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black45),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  SizedBox(
                      height: 50,
                      width: Get.width,
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'Enter email address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.grey)),
                        ),
                      )),
                  const Padding(padding: EdgeInsets.only(top: 40)),
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
