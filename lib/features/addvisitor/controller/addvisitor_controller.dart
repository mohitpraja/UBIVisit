import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/routes.dart';

class AddvisitorController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getSender().then((value) => loader.value = false);
    log('$getSenderInfo');
  }

  ScreenshotController screenshotController = ScreenshotController();

  RxBool loader = true.obs;

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
   var id = DateTime.now().millisecondsSinceEpoch.toString();
  final ImagePicker picker = ImagePicker();
  RxString imagePath = ''.obs;
  RxString qrPath = ''.obs;
  selectImage(context) async {
    final XFile? img =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (img != null) {
      imagePath.value = img.path;
    }
  }

  saveVisitor(context) async {
    if (imagePath.value == '') {

       CustomSnackbar(msg: 'Image required', title: 'Warning').show1();

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
            Get.toNamed(Routes.visitorotp, arguments: [
              name,
              address,
              phone,
              purpose,
              tomeet,
              File(imagePath.value),
              verificationId,
              finalSender,
              File(qrPath.value),
              id
            ]);
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      }
    }
  }

  List getSenderInfo = [];

  Future getSender() {
    return FirebaseFirestore.instance
        .collection('ubivisit/ubivisit/users')
        .where('organization', isEqualTo: FBase.userInfo['organization'])
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var e in querySnapshot.docs) {
        if (e['role'] == 'employee') {
          getSenderInfo.add({
            'name': e['name'],
            'pushtoken': e['pushtoken'],
            'email': e['email']
          });
        }
      }
    });
  }

  String tempSender = '';
  // ignore: prefer_typing_uninitialized_variables
  var finalSender;
  getSenderToken() {
    for (var element in getSenderInfo) {
      if (element['name'] == tempSender) {
        finalSender = element;
      }
    }
  }

  Future generateSS() async {
    var visitorInfo = {
      'name': name,
      'phone': phone,
      'address': address,
      'purpose': purpose,
      'tomeet': tomeet,
      'id':id
    };

    screenshotController
        .captureFromWidget(Container(
      color: Colors.white,
      child: SizedBox(
        height: Get.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'UBI',
                      style: TextStyle(
                          color: GlobalColor.customColor,
                          fontSize: Get.height * 0.05,
                          fontWeight: FontWeight.bold,
                          fontFamily: CustomFonts.alata),
                    ),
                    Text(
                      'Visit',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: Get.height * 0.05,
                          fontWeight: FontWeight.bold,
                          fontFamily: CustomFonts.alata),
                    )
                  ],
                ),
                Text(
                  "visitor's pass",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: Get.height * 0.023,
                      fontWeight: FontWeight.w500,
                      fontFamily: CustomFonts.alata),
                )
              ],
            ),
            Text(
              name.toUpperCase(),
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: Get.height * 0.045,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  fontFamily: CustomFonts.alata),
            ),
            QrImage(
              data: json.encode(visitorInfo),
              version: QrVersions.auto,
              size: 200.0,
              foregroundColor: Colors.black,
            ),
          ],
        ),
      ),
    ))
        .then((image) async {
      var id = DateTime.now().millisecondsSinceEpoch.toString();
      final directory = await getApplicationDocumentsDirectory();
      final imageAdd = await File('${directory.path}/$id.png').create();

      await imageAdd.writeAsBytes(image);
      qrPath.value = imageAdd.path;

      // Handle captured image
    });
  }
}
