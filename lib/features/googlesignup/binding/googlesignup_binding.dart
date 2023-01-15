import 'package:get/get.dart';
import 'package:ubivisit/features/googlesignup/controller/googlesignup_controller.dart';

class GoogleSignupBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(GoogleSignupController());
  }

}