import 'package:get/get.dart';
import 'package:visitantapp/features/visitoranalysis/controller/visitoranalysis_controller.dart';

class VisitorAnalysisBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(VisitorAnalysisController());
  }

}