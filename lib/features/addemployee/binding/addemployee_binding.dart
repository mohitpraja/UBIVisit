import 'package:get/get.dart';
import '../controller/addemployee_controller.dart';

class AddEmployeeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddEmployeeController());
  }

}