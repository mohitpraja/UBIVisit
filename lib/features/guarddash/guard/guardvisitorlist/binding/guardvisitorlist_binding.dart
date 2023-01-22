import 'package:get/get.dart';
import 'package:ubivisit/features/guarddash/guard/guardvisitorlist/controller/guardvisitorlist_controller.dart';

class GuardVisitorListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(GuardVisitorListController());
  }





}