import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FBase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future addUser(name,email,phone,password) {
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
      'id': id
    }).then((value) => print('_'));
  }

  static Future getData() async {
    firestore
        .collection('ubivisit/ubivisit/users')
        .get()
        // ignore: avoid_function_literals_in_foreach_calls
        .then((snapshot) => snapshot.docs.forEach((element) {
            }));
  }
}
