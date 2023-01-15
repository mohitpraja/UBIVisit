import 'package:get/get.dart';
import 'package:ubivisit/features/signup/controller/signup_controller.dart';

class SignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignupController());
  }

}