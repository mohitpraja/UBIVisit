import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddvisitorController extends GetxController {
  List<String> purpose = [
    'For interview',
    'For personal work',
    'For internship',
    'other'
  ];
  List<String> toMeetList = [
    'Mohit kumar',
    'Mohit Praja',
    'Atul Rajak',
    'Vivek Patel',
    'Prince',
    'Vipin'
  ];
   final ImagePicker picker=ImagePicker();
  RxString imagePath=''.obs;
  selectImage(context) async {
   final XFile? img=await picker.pickImage(source:ImageSource.camera,imageQuality: 80);
   if(img!=null){
    imagePath.value=img.path;
   }


  }
}
