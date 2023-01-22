import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/routes.dart';

class AddvisitorController extends GetxController {
  List<String> purposeList = [
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
  var name = '';
  var phone = '';
  var purpose = '';
  var address = '';
  var tomeet = '';
  final ImagePicker picker = ImagePicker();
  RxString imagePath = ''.obs;
  selectImage(context) async {
    final XFile? img =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (img != null) {
      imagePath.value = img.path;
    }
  }

  saveVisitor(context) async {
    if (imagePath.value == '') {
      const CustomSnackbar(msg: 'Image required', title: 'Warning').show1();
    } else {
      CustomLoader.showLoader(context);
      if (!(await InternetConnectionChecker().hasConnection)) {
        Get.back();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!!',
          desc: 'Check internet connection',
        ).show();
      } else {
        Get.back();
        // FBase.addVisitor(
        //         name, phone, address, purpose, tomeet, File(imagePath.value))
        //     .then((value) {
        //   AwesomeDialog(
        //     context: context,
        //     dialogType: DialogType.success,
        //     title: 'Success',
        //     desc: 'You have successfully add employee',
        //     dismissOnTouchOutside: false,
        //     btnOkOnPress: () => Get.offAllNamed(Routes.guarddash),
        //   ).show();
        // });
  
    CustomLoader.showLoader(context);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phone',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        Get.back();
        AwesomeDialog(
                context: context,
                dialogType: DialogType.error,
                title: 'Error',
                desc: '${e.message}')
            .show();
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.back();
        Get.toNamed(Routes.visitorotp,arguments: [name, address, phone, purpose, tomeet, File(imagePath.value),verificationId]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
      }
    }
  }
}
