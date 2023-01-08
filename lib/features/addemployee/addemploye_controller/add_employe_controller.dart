import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class AddEmployeeController extends GetxController {
 var isPassword = true.obs;
  var number = TextEditingController();
  final formkey = GlobalKey<FormState>();
  var password = TextEditingController();
   bool obsecureText = true;
  bool netStatus = true;
  bool formStatus = true;
  showPassword(){
   if (isPassword.value == true) {
    isPassword.value = false;
   } else
    {
     isPassword.value=true;
   }
  }
 SignUpAPI() async {
  var isValide = formkey.currentState?.validate();
  if (isValide == true) {
   Get.snackbar("alert", "Add employee successful",
       snackPosition: SnackPosition.TOP);
  }
  else {
   Get.snackbar("Warning", "Invalid credential",
       snackPosition: SnackPosition.BOTTOM);
  }
 }


}

