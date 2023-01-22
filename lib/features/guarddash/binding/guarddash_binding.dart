import 'package:get/get.dart';
import 'package:ubivisit/features/guarddash/controller/guarddash_controller.dart';
import 'package:ubivisit/features/guarddash/guard/guardhome/controller/guardhome_controller.dart';
import 'package:ubivisit/features/guarddash/guard/guardprofile/controller/guardprofile_controller.dart';
import 'package:ubivisit/features/guarddash/guard/guardvisitorlist/controller/guardvisitorlist_controller.dart';

class GuardDashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GuardDashController());
    Get.put(GuardProfileController());
    Get.put(GuardHomeController());
    Get.put(GuardVisitorListController());
  }
}
