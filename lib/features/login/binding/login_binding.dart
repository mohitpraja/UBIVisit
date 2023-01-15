import 'package:get/get.dart';
import 'package:ubivisit/features/login/controller/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
