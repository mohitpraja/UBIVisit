import 'package:get/get.dart';
import 'package:ubivisit/features/empdash/employee/emphome/view/emphome_view.dart';
import 'package:ubivisit/features/empdash/employee/empvisitorlist/view/empvisitorlist_view.dart';
import 'package:ubivisit/features/showprofile/view/showprofile_view.dart';

class EmpDashController extends GetxController {
  RxInt selectedindex = 0.obs;
  selectIndex(value) {
    selectedindex.value = value;
  }

  List adminallpages = [
    const EmpHomeView(),
    const EmpVisitorListView(),
    const ShowProfileView()
  ];
}
