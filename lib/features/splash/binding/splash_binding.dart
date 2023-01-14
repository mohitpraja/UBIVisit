import 'package:get/get.dart';
import 'package:visitantapp/features/splash/controller/splash_controller.dart';
import 'package:visitantapp/features/welcome/controller/welcome_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>WelcomeController());

    Get.put(SplashController());
  }
}
