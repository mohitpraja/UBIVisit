import 'package:get/get.dart';
import 'package:ubivisit/features/admindash/admin/adminprofile/controller/adminprofile_controller.dart';

class AdminProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminProfileController());
  }

}