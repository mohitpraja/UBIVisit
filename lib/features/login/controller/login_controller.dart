
import 'package:get/get.dart';

class LoginController extends GetxController {
  
   RxBool isPass=true.obs;
  showPass(){
    if(isPass.value==true){
      isPass.value=false;
    }else{
      isPass.value=true;
    }
  }

 


}
