import 'package:get/get.dart';
import 'package:ubivisit/features/guarddash/guard/guardprofile/controller/guardprofile_controller.dart';

class GuardProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(GuardProfileController());
  }

}