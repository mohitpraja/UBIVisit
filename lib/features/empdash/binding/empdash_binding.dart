import 'package:get/get.dart';
import 'package:ubivisit/features/empdash/controller/empdash_controller.dart';
import 'package:ubivisit/features/empdash/employee/emphome/controller/emphome_controller.dart';
import 'package:ubivisit/features/empdash/employee/empvisitorlist/controller/empvisitorlist_controller.dart';
import 'package:ubivisit/features/showprofile/controller/showprofile_controller.dart';

class EmpDashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EmpDashController());
    Get.put(EmpHomeController());
    Get.put(EmpVisitorListController());
    Get.put(ShowProfileController());
  }
}
