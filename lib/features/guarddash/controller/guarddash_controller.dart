import 'package:get/get.dart';
import 'package:ubivisit/features/guarddash/guard/guardhome/view/guardhome_view.dart';
import 'package:ubivisit/features/guarddash/guard/guardprofile/view/guardprofile_view.dart';
import 'package:ubivisit/features/guarddash/guard/guardvisitorlist/view/guardvisitorlist_view.dart';

class GuardDashController extends GetxController {
  var indexFromDash=Get.arguments;

  RxInt selectedindex = 0.obs;
  selectIndex(value) {
    selectedindex.value = value;
  }

  List adminallpages = [
    GuardHomeView(),
    const GuardVisitorListView(),
    const GuardProfileView()
  ];
}
