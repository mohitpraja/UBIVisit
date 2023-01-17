
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ubivisit/core/fbase/firebase.dart';

class AdminHomeController extends GetxController {
  @override
  Future<void> onInit() async {
    var db=await Hive.openBox('ubivisit');
    FBase.userInfo.value=db.get('userInfo');
    loader.value=false;
    super.onInit();
  }
  RxBool loader=true.obs;

    
 
}
