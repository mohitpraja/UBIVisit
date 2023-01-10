import 'package:get/get.dart';
import 'package:visitantapp/features/admindash/admin/adminhome/controller/adminhome_controller.dart';

class AdminHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminHomeController());
  }

}