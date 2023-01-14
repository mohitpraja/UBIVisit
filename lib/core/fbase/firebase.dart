import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FBase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future addUser() {
    log('cld');
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    return firestore
        .collection('ubivisit')
        .doc('ubivisit')
        .collection('users')
        .doc(id)
        .set({
      'name': 'Mohit',
      'email': 'mohit@gmail.com',
      'post': 'admin',
      'password': 'pass',
      'phone': '8103586806',
      'id': id
    }).then((value) => print('_'));
  }

  static Future getData() async {
    firestore
        .collection('ubivisit/ubivisit/users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((element) {
      print(element['name']);
    }));
  }
}
