import 'package:get/get.dart';
import 'package:visitantapp/features/addemployee/controller/addemploye_controller.dart';

class AddEmployeeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddEmployeeController());
  }

}