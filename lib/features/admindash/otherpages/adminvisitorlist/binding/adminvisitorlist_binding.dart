import 'package:get/get.dart';
import 'package:visitantapp/features/admindash/otherpages/adminvisitorlist/controller/adminvisitorlist_controller.dart';

class AdminVisitorListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AdminVisitorListController());
  }





}