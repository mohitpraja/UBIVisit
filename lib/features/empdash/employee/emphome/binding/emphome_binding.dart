import 'package:get/get.dart';
import 'package:ubivisit/features/empdash/employee/emphome/controller/emphome_controller.dart';

class EmpHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EmpHomeController());
  }

}