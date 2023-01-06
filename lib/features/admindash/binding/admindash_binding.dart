import 'package:get/get.dart';
import 'package:visitantapp/features/admindash/controller/admindash_controller.dart';

class AdminDashBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminDashController());
  }

}