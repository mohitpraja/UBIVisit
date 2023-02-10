import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/underlinetextfield.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';

class EditProfileController extends GetxController {
  @override
  Future<void> onInit() async {
    var db = await Hive.openBox('ubivisit');
    FBase.userInfo.value = db.get('userInfo');
    loader.value = false;
    super.onInit();
  }

  RxBool loader = true.obs;
  var tempUpdate = '';
  showBottomSheet(context, fieldname, value, updateField) {
    Get.bottomSheet(Container(
      color: Colors.white,
      child: Container(
          margin: const EdgeInsets.all(15),
          height: Get.height * 0.2,
          child: Form(
            key: Validation.editProfileFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Your $fieldname',
                  style: TextStyle(
                      fontFamily: CustomFonts.alata,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                UnderLineTextField(
                  hintText: 'Enter $fieldname',
                  initialValue: value,
                  onchanged: (value) => tempUpdate = value,
                  validator: (value) {
                    if (fieldname == 'Name') {
                      if (value!.isEmpty ||
                          !RegExp(r'^[a-z A-Z/+0-9]+$').hasMatch(value) ||
                          RegExp(r'^[0-9]+$').hasMatch(value)) {
                        return 'Enter Correct Field';
                      }
                    } else if (fieldname == 'Email') {
                      if (value!.isEmpty ||
                          !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                        return 'Enter Correct Email';
                      }
                    } else if (fieldname == 'Phone number') {
                      if (value!.isEmpty ||
                          !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                        return 'Incorrect Phone Number';
                      }
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () => Get.back(),
                        child: Text(
                          'cancel',
                          style: TextStyle(
                              fontFamily: CustomFonts.alata,
                              fontSize: 17,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500),
                        )),
                    TextButton(
                        onPressed: () {
                          if (Validation.editProfileFormKey.currentState!
                              .validate()) {
                            if (tempUpdate == '') {
                              tempUpdate = value;
                            }
                            if (fieldname == 'Phone number') {
                              sendOtp(context, tempUpdate);
                            } else {
                              FBase.updateUserInfo(
                                      context,
                                      updateField,
                                      tempUpdate,
                                      FBase.userInfo['id'],
                                      Routes.editprofile)
                                  .then((value) {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  title: 'Success',
                                  desc: '$fieldname Updated Successfully',
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () => Get.back(),
                                ).show();
                              });
                            }
                          }
                        },
                        child: Text(
                          'Save',
                          style: TextStyle(
                              fontFamily: CustomFonts.alata,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ))
                  ],
                )
              ],
            ),
          )),
    ));
  }

  choosePic(context) {
    Get.bottomSheet(
      SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Choose Profile Picture',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.photo,
                        size: 30,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Gallery'),
                    ],
                  ),
                  onTap: () {
                    selectImage(ImageSource.gallery, context);
                  },
                ),
                const SizedBox(
                  width: 60,
                ),
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.camera,
                        size: 30,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Camera')
                    ],
                  ),
                  onTap: () {
                    selectImage(ImageSource.camera, context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  final ImagePicker picker = ImagePicker();
  RxString imagePath = ''.obs;
  selectImage(src, context) async {
    final XFile? img = await picker.pickImage(source: src, imageQuality: 80);
    if (img != null) {
      imagePath.value = img.path;
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
        FBase.uploadImage(
          File(imagePath.value),
          FBase.userInfo['id'],
          context,
        ).then((value) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            title: 'Success',
            desc: 'Image Updated Successfully',
            dismissOnTouchOutside: false,
            btnOkOnPress: () => Get.back(),
          ).show();
        });
        Get.back();
      }
    }
  }

  sendOtp(context, phone) async {
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
                dismissOnTouchOutside: true,
                desc: '${e.message}')
            .show();
      },
      codeSent: (String verificationId, int? resendToken) {
        Get.back();
        Get.toNamed(Routes.profileotp,
            arguments: [phone, verificationId, 'phone', FBase.userInfo['id']]);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  gotoRoute() {
    if (FBase.userInfo['post'] == 'Admin') {
      Get.offAllNamed(Routes.admindash);
    } else if (FBase.userInfo['post'] == 'Guard') {
      Get.offAllNamed(Routes.guarddash);
    } else {
      Get.offAllNamed(Routes.empdash);
    }
  }
}
