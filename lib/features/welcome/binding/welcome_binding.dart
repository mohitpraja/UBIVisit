import 'package:get/get.dart';
import 'package:visitantapp/features/welcome/controller/welcome_controller.dart';

class WelcomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(WelcomeController());
  }

}