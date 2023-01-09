import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:visitantapp/features/addvisitor/controller/addvisitor_controller.dart';

class AddvisitorBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AddvisitorController());

  }



}