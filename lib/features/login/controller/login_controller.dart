import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/routes.dart';

class LoginController extends GetxController {
  final phone = TextEditingController();
  final pass = TextEditingController();

  

  Future login(context, phone, pass) async {
    CustomLoader.showLoader(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Get.back();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: 'Warning!!!',
        desc: 'Check internet connection',
      ).show();
    } else {
      Get.back();
      FBase.getData(context, phone, pass);
    }
  }

  googleSignIn(context) async {
    CustomLoader.showLoader(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Get.back();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: 'Warning!!!',
        desc: 'Check internet connection',
      ).show();
    } else {
      GoogleSignIn googleSignIn = GoogleSignIn();
      try {
        var result = await googleSignIn.signIn();
        if (result == null) {
          return;
        }
        logout();
        Get.back();
        Get.toNamed(Routes.googlesignup, arguments: result.email);
      } catch (e) {
         CustomSnackbar(title: 'Error', msg: 'something went wrong')
            .show1();
      }
    }
  }

  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }
}
