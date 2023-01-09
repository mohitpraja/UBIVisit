import 'package:get/get.dart';
import 'package:visitantapp/features/admindash/admin/adminprofile/controller/adminprofile_controller.dart';

class AdminProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminProfileController());
  }

}