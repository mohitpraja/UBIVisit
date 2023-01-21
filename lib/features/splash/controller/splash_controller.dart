import 'dart:async';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/routes.dart';

class SplashController extends GetxController {
  bool isLogin = false;
  String post = '';
  @override
  void onInit() {
    super.onInit();
    getdata();
    Timer(const Duration(seconds: 3), () {
      if (isLogin) {
        if (post == 'Admin') {
          Get.offAllNamed(Routes.admindash);
        } else if (post == 'Guard') {
          Get.offAllNamed(Routes.guarddash);
        } else {
          Get.offAllNamed(Routes.empdash);
        }
      } else {
        Get.offAllNamed(Routes.introduction);
      }
    });
  }

  Future<void> getdata() async {
    var pref = await SharedPreferences.getInstance();
    var db = await Hive.openBox('ubivisit');
    FBase.userInfo.value = db.get('userInfo');
    post = FBase.userInfo['post'];
    isLogin = pref.getBool('isLogin')!;
  }
}
