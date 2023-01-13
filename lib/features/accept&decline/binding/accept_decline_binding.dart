import 'package:get/instance_manager.dart';
import '../controller/accept_decline_controller.dart';


class AcceptDeclineBinding extends Bindings {

  @override
  void dependencies(){

    Get.put(AcceptDeclineController());
  }
}
