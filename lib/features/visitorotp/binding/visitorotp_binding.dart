import 'package:get/get.dart';
import 'package:ubivisit/features/visitorotp/controller/visitorotp_controller.dart';

class VisitorOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(VisitorOtpController());
  }
}
