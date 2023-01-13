import 'package:get/get.dart';

class AdminHomeController extends GetxController{

  RxInt check=0.obs;
  forcheck(){
    check.value=1;
  }
}