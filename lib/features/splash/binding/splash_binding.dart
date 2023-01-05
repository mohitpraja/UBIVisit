import 'package:get/get.dart';
import 'package:visitantapp/features/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {

    Get.put(SplashController());
  }

}