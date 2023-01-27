import 'package:get/get.dart';
import 'package:ubivisit/features/forgototp/controller/forgot_otp_controller.dart';

class ForgotOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotOtpController());
  }
}
