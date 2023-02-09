import 'package:get/get.dart';
import 'package:ubivisit/features/guarddash/guard/guardhome/view/guardhome_view.dart';
import 'package:ubivisit/features/guarddash/guard/guardvisitorlist/view/guardvisitorlist_view.dart';
import 'package:ubivisit/features/showprofile/view/showprofile_view.dart';

class GuardDashController extends GetxController {
  var indexFromDash = Get.arguments;

  RxInt selectedindex = 0.obs;
  selectIndex(value) {
    selectedindex.value = value;
  }

  List adminallpages = [
    const GuardHomeView(),
    const GuardVisitorListView(),
    // const GuardProfileView()
    const ShowProfileView()
  ];
}
