import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/routes.dart';

class FBase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future addUser(name, email, phone, password, post, role) {
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
      'post': post,
      'password': password,
      'phone': phone,
      'image': '',
      'role': role,
      'id': id
    });
  }

  static Stream getUserInfo(id) {
    return firestore
        .collection('ubivisit/ubivisit/users')
        .where('id', isEqualTo: id)
        .snapshots();
  }

  static Stream collectionPathEmp = firestore
      .collection('ubivisit/ubivisit/users')
      .where('role', isEqualTo: 'employee')
      .snapshots();
  static Stream collectionPathGuard = firestore
      .collection('ubivisit/ubivisit/users')
      .where('post', isEqualTo: 'Guard')
      .snapshots();
  static bool isMatch = false;
  static RxMap userInfo = {}.obs;

  static Future getData(context, phone, pass) async {
    final prefs = await SharedPreferences.getInstance();
    var db = await Hive.openBox('ubivisit');
    var post = '';
    CustomLoader.showLoader(context);
    firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          var data = e.data();
          if ((data['phone'] == phone || data['eamil'] == phone) &&
              data['password'] == pass) {
            isMatch = true;
            post = data['post'];
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
      if (isMatch) {
        if (post == 'Admin') {
          Get.offAllNamed(Routes.admindash);
        } else if (post == 'Guard') {
          Get.offAllNamed(Routes.guarddash);
        } else {
          Get.offAllNamed(Routes.empdash);
        }
      } else {
        const CustomSnackbar(title: 'Warning', msg: 'Invalid credentials')
            .show1();
      }
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

  static updateUserInfo(context, updateField, value, id,route) async {
    await Hive.deleteBoxFromDisk('ubivisit');
    var db = await Hive.openBox('ubivisit');
  CustomLoader.showLoader(context);
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
              isMatch = true;
              db.put('userInfo', {
                'name': data['name'],
                'email': data['email'],
                'password': data['password'],
                'post': data['post'],
                'id': data['id'],
                'image': data['image'],
                'phone': data['phone'],
              }).then((value) {
                Get.back();
                Get.offAllNamed(route);
              });
            }
          },
        );
      });
    });
  }

  static deleteUser(id, context) {
    CustomLoader.showLoader(context);
    firestore
        .collection('ubivisit/ubivisit/users')
        .doc(id)
        .delete()
        .then((value) => Get.back());
  }

  static updateEmpInfo(context, id, name, email, phone, role, password) {
    CustomLoader.showLoader(context);
    firestore.collection('ubivisit/ubivisit/users').doc(id).update({
      'name': name,
      'email': email,
      'phone': phone,
      'post': role,
      'password': password,
    }).then((value) => Get.back());
  }

  static uploadImage(file, id, context,route) async {
    await Hive.deleteBoxFromDisk('ubivisit');
    var db = await Hive.openBox('ubivisit');
    CustomLoader.showLoader(context);
    final ext = file.path.split('.').last;
    final ref = storage.ref().child('users/profiles/$id.$ext');
    ref.putFile(file).then((p0) {
      log('image status:${p0.bytesTransferred / 1000}');
    });
    final imgUrl = await ref.getDownloadURL();
    firestore
        .collection('ubivisit/ubivisit/users')
        .doc(id)
        .update({'image': imgUrl}).then(
      (value) {
        firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
          // ignore: avoid_function_literals_in_foreach_calls
          snapshot.docs.forEach(
            (e) async {
              var data = e.data();
              if (data['id'] == id) {
                isMatch = true;
                db.put('userInfo', {
                  'name': data['name'],
                  'email': data['email'],
                  'password': data['password'],
                  'post': data['post'],
                  'id': data['id'],
                  'image': data['image'],
                  'phone': data['phone'],
                }).then((value) {
                  Get.back();
                  Get.offAllNamed(route);
                });
              }
            },
          );
        });
      },
    );
  }
}
