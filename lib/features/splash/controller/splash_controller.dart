import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/routes.dart';

class SplashController extends GetxController {
  bool isLogin = false;
  @override
  void onInit() {
    super.onInit();
    getdata();
    Timer(
      const Duration(seconds: 3),
      () => isLogin == true
          ? Get.offAllNamed(Routes.admindash)
          : Get.offAllNamed(Routes.welcome),
    );
  }

  Future<void> getdata() async {
    var pref = await SharedPreferences.getInstance();
    isLogin = pref.getBool('islogin')!;
  }
}
