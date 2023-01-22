import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class GuardVisitorListController extends GetxController{

List allVisitors = [];
final Stream visitorStream =
      FirebaseFirestore.instance.collection('ubivisit/ubivisit/visitors').snapshots();

}