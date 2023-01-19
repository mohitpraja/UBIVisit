
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController {
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();

  Future passwordReset(context) async {
    print(emailController.text);
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
          email: emailController.text.trim());
      showDialog(
          context : context,
          builder:(context){
            return const AlertDialog(
              content: Text('Password reset link sent! check your email'),
            );
          }
      );
    } on FirebaseAuthException catch (emailController) {
      print(emailController);
      showDialog(
          context : context,
          builder:(context){
            return AlertDialog(
              content: Text(emailController.message.toString()),
            );
          }
      );
    }
  }
}
