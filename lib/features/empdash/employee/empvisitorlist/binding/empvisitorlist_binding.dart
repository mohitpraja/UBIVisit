import 'package:get/get.dart';
import 'package:ubivisit/features/admindash/admin/adminvisitorlist/controller/adminvisitorlist_controller.dart';
import 'package:ubivisit/features/empdash/employee/empvisitorlist/controller/empvisitorlist_controller.dart';

class EmpVisitorListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EmpVisitorListController());
  }





}