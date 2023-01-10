import 'package:get/get.dart';
import 'package:visitantapp/features/addvisitor/controller/addvisitor_controller.dart';

class AddvisitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddvisitorController());
  }
}
