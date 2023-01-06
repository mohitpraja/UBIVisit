import 'package:get/get.dart';
import 'package:visitantapp/features/forgot/controller/forgot_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotController());
  }
}
