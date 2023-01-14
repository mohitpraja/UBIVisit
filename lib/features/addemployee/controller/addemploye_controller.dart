import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AddEmployeeController extends GetxController {
 GlobalKey<FormState> formkeyValidation= GlobalKey<FormState>();


 var isPassword = true.obs;
 final TextEditingController Password = TextEditingController();
 final TextEditingController confirmPassword = TextEditingController();
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
 onSaveform(){
  var isValide = formkeyValidation.currentState?.validate();
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

