import 'package:get/get.dart';
import 'package:ubivisit/features/guarddash/guard/guardhome/view/guardhome_view.dart';
import 'package:ubivisit/features/guarddash/guard/guardprofile/view/guardprofile_view.dart';
import 'package:ubivisit/features/guarddash/guard/guardvisitorlist/view/adminvisitorlist_view.dart';

class GuardDashController extends GetxController {
  RxInt selectedindex = 0.obs;
  selectIndex(value) {
    selectedindex.value = value;
  }

  List adminallpages = [
    const GuardHomeView(),
    const GuardVisitorListView(),
    const GuardProfileView()
  ];
}
