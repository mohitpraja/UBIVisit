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
      'image': '',
      'id': id
    });
  }

  static bool isMatch = false;

  static Future getData(context, phone, pass) async {
    final prefs = await SharedPreferences.getInstance();
    CustomLoader.showLoader(context);
    firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          var data = e.data();
          if ((data['phone'] == phone || data['eamil'] == phone) &&
              data['password'] == pass) {
            isMatch = true;
            await prefs.setBool('islogin', true);
            await prefs.setString('name', data['name']);
            await prefs.setString('email', data['email']);
            await prefs.setString('password', data['password']);
            await prefs.setString('phone', data['phone']);
            await prefs.setString('image', data['image']);
            await prefs.setString('post', data['post']);
            await prefs.setString('id', data['id']);

            print(data);
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
  static bool isUser=false;
  static checkUser(val) {
    print('check usr cld $val');
    firestore
        .collection('ubivisit/ubivisit/users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((e) {
          if((e.data()['phone']==val)||(e.data()['email']==val)){
           isUser=true;
          }
        })).then((value){
          if(isUser){
            return 'this $val is already exist';
          }
        });
  }
}
