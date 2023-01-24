import 'package:get/get.dart';
import 'package:ubivisit/features/guarddash/controller/guarddash_controller.dart';
import 'package:ubivisit/features/guarddash/guard/guardhome/controller/guardhome_controller.dart';

class GuardHomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(GuardHomeController());
  }

}