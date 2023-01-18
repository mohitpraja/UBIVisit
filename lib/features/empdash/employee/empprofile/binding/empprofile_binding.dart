import 'package:get/get.dart';
import 'package:ubivisit/features/empdash/employee/empprofile/controller/empprofile_controller.dart';

class EmpProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EmpProfileController());
  }

}