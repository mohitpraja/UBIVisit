import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/routes.dart';

class FBase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future addUser(name, email, phone, password) {
    log('cld');
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    return firestore
        .collection('ubivisit')
        .doc('ubivisit')
        .collection('users')
        .doc(id)
        .set({
      'name': name,
      'email': email,
      'post': 'admin',
      'password': password,
      'phone': phone,
      'image': '',
      'id': id
    });
  }

  static bool isMatch = false;
  static RxMap userInfo = {}.obs;

  static Future getData(context, phone, pass) async {
    final prefs = await SharedPreferences.getInstance();
    var db = await Hive.openBox('ubivisit');
    CustomLoader.showLoader(context);
    firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          var data = e.data();
          if ((data['phone'] == phone || data['eamil'] == phone) &&
              data['password'] == pass) {
            isMatch = true;
            db.put('userInfo', {
              'name': data['name'],
              'email': data['email'],
              'password': data['password'],
              'post': data['post'],
              'id': data['id'],
              'image': data['image'],
              'phone': data['phone'],
            });

            await prefs.setBool('isLogin', true);
          }
        },
      );
    }).then((value) {
      Get.back();
      isMatch == true
          ? Get.offAllNamed(Routes.admindash)
          : const CustomSnackbar(title: 'Warning', msg: 'Invalid credentials')
              .show1();
    });
  }

  static bool isPhoneExist = false;
  static bool isEmailExist = false;

  static Future checkUser(phone, email) async {
    await firestore
        .collection('ubivisit/ubivisit/users/')
        .where('phone', isEqualTo: phone)
        .get()
        .then((e) {
      if (e.docs.isNotEmpty) {
        isPhoneExist = true;
      } else {
        isPhoneExist = false;
      }
    });
    await firestore
        .collection('ubivisit/ubivisit/users/')
        .where('email', isEqualTo: email)
        .get()
        .then((e) {
      if (e.docs.isNotEmpty) {
        isEmailExist = true;
      } else {
        isEmailExist = false;
      }
    });
  }

  static updateUserInfo(updateField, value, id) async {
    await Hive.deleteBoxFromDisk('ubivisit');
    var db = await Hive.openBox('ubivisit');
    firestore
        .collection('ubivisit/ubivisit/users')
        .doc(id)
        .update({updateField: value}).then((val) {
      firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        snapshot.docs.forEach(
          (e) async {
            var data = e.data();
            if (data['id'] == id) {
              print(data);
              isMatch = true;
              db.put('userInfo', {
                'name': data['name'],
                'email': data['email'],
                'password': data['password'],
                'post': data['post'],
                'id': data['id'],
                'image': data['image'],
                'phone': data['phone'],
              }).then((value) => Get.offAllNamed(Routes.admindash));
            }
          },
        );
      });
    });
  }
}
