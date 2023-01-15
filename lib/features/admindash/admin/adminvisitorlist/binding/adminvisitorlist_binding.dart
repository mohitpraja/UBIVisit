import 'package:get/get.dart';
import 'package:ubivisit/features/admindash/admin/adminvisitorlist/controller/adminvisitorlist_controller.dart';

class AdminVisitorListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminVisitorListController());
  }





}