import 'package:get/get.dart';
import 'package:visitantapp/features/otp/controller/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpController());
  }
}
