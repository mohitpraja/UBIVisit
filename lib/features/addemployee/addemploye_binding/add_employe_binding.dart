import 'package:get/get.dart';
import 'package:visitantapp/features/addemployee/addemploye_controller/add_employe_controller.dart';



class AddEmployeeBinding extends Bindings {

  @override
  void dependencies(){

    Get.put(AddEmployeeController());
  }
}