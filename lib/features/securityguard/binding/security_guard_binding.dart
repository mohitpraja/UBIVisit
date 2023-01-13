import 'package:get/get.dart';
import '../controller/security_guard_controller.dart';

class SecurityGuardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SecurityGuardController());
  }

}