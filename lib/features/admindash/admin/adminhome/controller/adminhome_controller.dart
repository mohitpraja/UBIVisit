import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/fbase/firebase.dart';

class AdminHomeController extends GetxController {
  @override
  void onInit() {
    getdata();
    super.onInit();
  }

  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  RxString password = ''.obs;
  RxString image = ''.obs;
  RxString post = ''.obs;
  getdata() async {
    final pref = await SharedPreferences.getInstance();
    name.value = pref.getString('name')!;
    email.value = pref.getString('email')!;
    phone.value = pref.getString('phone')!;
    password.value = pref.getString('password')!;
    image.value = pref.getString('image')!;
    post.value = pref.getString('post')!;
  }
}
