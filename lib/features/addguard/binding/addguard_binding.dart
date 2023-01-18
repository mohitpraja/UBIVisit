import 'package:get/get.dart';
import 'package:ubivisit/features/addguard/controller/addguard_controller.dart';

class AddGuardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddGuardController());
  }

}