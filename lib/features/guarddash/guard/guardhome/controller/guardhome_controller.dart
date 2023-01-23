
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ubivisit/core/fbase/firebase.dart';

class GuardHomeController extends GetxController {
  @override
  Future<void> onInit() async {
    var db=await Hive.openBox('ubivisit');
    FBase.userInfo.value=db.get('userInfo');
    loader.value=false;
    super.onInit();
  }
  RxBool loader=true.obs;
  List allVisitors = [];
final Stream visitorStream =
      FirebaseFirestore.instance.collection('ubivisit/ubivisit/visitors').snapshots();

    
 
}
