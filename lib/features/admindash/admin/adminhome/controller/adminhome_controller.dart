
import 'dart:developer';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomeController extends GetxController{
  @override
  void onInit() {
    getData().whenComplete((){
      loader.value=false;
      log('loader user : $userData');
      print('loder set');
    });
    log('data: $userData');
    super.onInit();
  }
  RxBool loader=true.obs;
   late List<String>? userData=[];
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    userData = prefs.getStringList('items');
    print(userData);
    print('all data comed');

  }
 
 

}