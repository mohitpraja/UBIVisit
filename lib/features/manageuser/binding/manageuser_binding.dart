import 'package:get/get.dart';
import 'package:ubivisit/features/manageuser/allemployeedata/allemployeedata_controller.dart';
import 'package:ubivisit/features/manageuser/allguarddata/allguarddata_controller.dart';
import 'package:ubivisit/features/manageuser/controller/manageuser_controller.dart';

class ManageUserBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ManageUserController());
    Get.put(AllEmployeeDataController());
    Get.put(AllGuardDataController());
  }

}