import 'package:get/get.dart';
import 'package:visitantapp/features/admindash/otherpages/adminhome/view/adminhome_view.dart';
import 'package:visitantapp/features/admindash/otherpages/adminprofile/view/adminprofile_view.dart';
import 'package:visitantapp/features/admindash/otherpages/adminvisitorlist/view/adminvisitorlist_view.dart';

class AdminDashController extends GetxController {
  RxInt selectedindex = 0.obs;
  selectIndex(value) {
    selectedindex.value = value;
  }

  List adminallpages = [
    const AdminHomeView(),
    const AdminVisitorListView(),
    const AdminProfileView()
  ];
}
