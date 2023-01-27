import 'package:get/get.dart';
import 'package:ubivisit/features/updatepass/controller/updatepass_controller.dart';

class UpdatePassBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UpdatePassController());
  }

}