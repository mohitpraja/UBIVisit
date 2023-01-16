import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
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
      'image': 'null',
      'id': id
    });
  }

  static bool isMatch = false;

  static Future getData(context, phone, pass) async {
    final prefs = await SharedPreferences.getInstance();
    CustomLoader.showLoader(context);
    firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach((e) async {
        var data = e.data();
        if ((data['phone'] == phone||data['eamil'] == phone) && data['password'] == pass) {
          isMatch = true;
          await prefs.setBool('islogin', true);
          print(data);
          await prefs.setStringList('items', <String>[
            data['name'],
            data['email'],
            data['phone'],
            data['password'],
            data['image'],
            data['id'],
            data['post']
          ]);
        }
      });
    }).then((value) {
      Get.back();
      isMatch == true
          ? Get.offAllNamed(Routes.admindash)
          : const CustomSnackbar(title: 'Warning', msg: 'Invalid credentials')
              .show1();
    });
  }
 
}
