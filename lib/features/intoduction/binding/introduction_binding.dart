import 'package:get/get.dart';
import 'package:visitantapp/features/intoduction/controller/introduction_controller.dart';

class IntroductionBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(IntroductionController());
  }

}