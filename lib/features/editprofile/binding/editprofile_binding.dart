import 'package:get/get.dart';
import 'package:ubivisit/features/editprofile/controller/editprofile_controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(EditProfileController());
  }

}