import 'package:get/get.dart';
import 'package:ubivisit/features/profileotp/controller/profileotp_controller.dart';

class ProfileOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileOtpController());
  }
}
