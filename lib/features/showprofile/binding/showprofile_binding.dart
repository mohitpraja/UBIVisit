import 'package:get/get.dart';
import 'package:ubivisit/features/showprofile/controller/showprofile_controller.dart';

class ShowProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ShowProfileController());
  }
}
