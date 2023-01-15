import 'dart:async';

import 'package:get/get.dart';
import 'package:ubivisit/core/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Timer(
        const Duration(milliseconds:2300), () => Get.offAllNamed(Routes.introduction));
    super.onInit();
  }
}
