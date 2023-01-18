import 'package:get/get.dart';
import 'package:ubivisit/features/addemployee/controller/addemployee_controller.dart';

class AddEmployeeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddEmployeeController());
  }

}