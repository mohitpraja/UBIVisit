import 'package:get/get.dart';
import 'package:visitantapp/features/admindash/admin/adminhome/controller/adminhome_controller.dart';
import 'package:visitantapp/features/admindash/admin/adminprofile/controller/adminprofile_controller.dart';
import 'package:visitantapp/features/admindash/controller/admindash_controller.dart';

class AdminDashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminDashController());
    Get.put(AdminProfileController());
    Get.put(AdminHomeController());
  }

}