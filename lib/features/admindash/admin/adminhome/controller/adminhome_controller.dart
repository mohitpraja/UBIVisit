
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeController extends GetxController{
  @override
  void onInit() {
    getData().then((value) => loader.value=false);
    super.onInit();
  }
  RxBool loader=true.obs;
   late List<String>? userData=[];
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    userData = prefs.getStringList('items');
  }
 
 

}