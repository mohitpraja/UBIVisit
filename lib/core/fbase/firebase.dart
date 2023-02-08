import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/components/customloader.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:telephony/telephony.dart';

class FBase {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;
  static FirebaseMessaging fmessaging = FirebaseMessaging.instance;
  static Telephony telephony = Telephony.instance;

  static Future addUser(name, email, phone, password, post, role,organization) async {
    log('cld');
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    await fmessaging.requestPermission();
    String pushtoken = '';
    await fmessaging.getToken().then((token) {
      if (token != null) {
        log('push token:$token');
        pushtoken = token;
      }
    });

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
      'id': id,
      'pushtoken': pushtoken,
      'organization': organization
    });
  }

  static Stream getUserInfo(id) {
    return firestore
        .collection('ubivisit/ubivisit/users')
        .where('id', isEqualTo: id)
        .snapshots();
  }

  static Stream getEmpVisitor(name) {
    return firestore
        .collection('ubivisit/ubivisit/visitors')
        .where('tomeet', isEqualTo: name)
        .snapshots();
  }

  static Stream collectionPathEmp = firestore
      .collection('ubivisit/ubivisit/users')
      .where('role', isEqualTo: 'employee')
      .where('organization',isEqualTo:userInfo['organization'])
      .snapshots();
  static Stream collectionPathGuard = firestore
      .collection('ubivisit/ubivisit/users')
      .where('post', isEqualTo: 'Guard')
      .where('organization',isEqualTo:userInfo['organization'])
      .snapshots();
  static bool isMatch = false;
  static RxMap userInfo = {}.obs;

  static Future getData(context, phone, pass) async {
    final prefs = await SharedPreferences.getInstance();
    var db = await Hive.openBox('ubivisit');
    var post = '';
    String pushtoken = '';
    await fmessaging.getToken().then((token) {
      if (token != null) {
        log('push token:$token');
        pushtoken = token;
      }
    });
    CustomLoader.showLoader(context);
    firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          var data = e.data();
          if ((data['phone'] == phone || data['eamil'] == phone) &&
              data['password'] == pass) {
            isMatch = true;
            firestore
                .collection('ubivisit/ubivisit/users')
                .doc(data['id'])
                .update({"pushtoken": pushtoken});
            post = data['post'];
            db.put('userInfo', {
              'name': data['name'],
              'email': data['email'],
              'password': data['password'],
              'post': data['post'],
              'id': data['id'],
              'image': data['image'],
              'phone': data['phone'],
              'pushtoken': data['pushtoken'],
              'organization': data['organization'],
            });

            await prefs.setBool('isLogin', true);
          }
        },
      );
    }).then((value) {
      Get.back();
      if (isMatch) {
        if (post == 'Admin') {
          isMatch = false;
          Get.offAllNamed(Routes.admindash);
        } else if (post == 'Guard') {
          isMatch = false;
          Get.offAllNamed(Routes.guarddash);
        } else {
          isMatch = false;
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

  static Future updatePass(phone, password) async {
    String id = '';
    firestore.collection('ubivisit/ubivisit/users').get().then((snapshot) {
      // ignore: avoid_function_literals_in_foreach_calls
      snapshot.docs.forEach(
        (e) async {
          var data = e.data();
          if (data['phone'] == phone || data['eamil'] == phone) {
            isMatch = true;
            id = data['id'];
          }
        },
      );
      firestore
          .collection('ubivisit/ubivisit/users')
          .doc(id)
          .update({'password': password});
    });
  }

  static updateUserInfo(context, updateField, value, id, route) async {
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
                'pushtoken': data['pushtoken'],
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

  static uploadImage(file, id, context, route) async {
    await Hive.deleteBoxFromDisk('ubivisit');
    var db = await Hive.openBox('ubivisit');
    CustomLoader.showLoader(context);
    final ext = file.path.split('.').last;
    final ref = storage.ref().child('users/profiles/$id.$ext');
    ref.putFile(file).then((p0) async {
      log('image status:${p0.bytesTransferred / 1000}');
      final imgUrl = await ref.getDownloadURL();
      firestore
          .collection('ubivisit/ubivisit/users')
          .doc(id)
          .update({'image': imgUrl}).then(
        (value) {
          firestore
              .collection('ubivisit/ubivisit/users')
              .get()
              .then((snapshot) {
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
                    'pushtoken': data['pushtoken'],
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
    });
  }

  static Future addVisitor(
      name, phone, address, purpose, tomeet, image, qr,organization) async {
    var id = DateTime.now().millisecondsSinceEpoch.toString();
    final imgId = image.path.split('/').last;
    final qrId = qr.path.split('/').last;

    final ref = storage.ref().child('users/visitors/$imgId');
    final qrRef = storage.ref().child('users/visitors/$qrId');
    ref.putFile(image).then((p0) async {
      // log('image status:${p0.bytesTransferred / 1000}');
      // log('p0:$p0');
      qrRef.putFile(qr).then((p0) async {
        var currDate = DateTime.now();
        String time = DateFormat('jm').format(currDate);
        String date = '${currDate.day}-${currDate.month}-${currDate.year}';

        final imgUrl = await ref.getDownloadURL();
        final qrUrl = await qrRef.getDownloadURL();
        log(imgUrl);
        await firestore
            .collection('ubivisit')
            .doc('ubivisit')
            .collection('visitors')
            .doc(id)
            .set({
          'name': name,
          'address': address,
          'phone': phone,
          'image': imgUrl,
          'purpose': purpose,
          'tomeet': tomeet,
          'id': id,
          'date': date,
          'time': time,
          'status': 'waiting...',
          'timeout': '',
          'qr': qrUrl,
          'organization': organization
        });
      });
    });
  }

  static getMessagingToken() async {
    await fmessaging.requestPermission();
    await fmessaging.getToken().then((token) {
      if (token != null) {
        log('push token:$token');
      }
    });
  }

  static sendNotification(token, visitorData) async {
    try {
      final body = {
        "to": token['pushtoken'],
        "notification": {"title": 'Ubivisit', "body": "One person arrived"}
      };
      var name = visitorData[0];
      var email = token['email'];
      var phone = visitorData[2];
      var purpose = visitorData[3];
      var address = visitorData[1];

      // ignore: unused_local_variable
      var responseEmail = await post(Uri.parse(
          'https://ubiattendance.ubiattendance.xyz/newpanel/index.php/Att_services_getx_xyz_regendra/visitorMail?visitorName=$name&visitorContactNumber=$phone&visitorAddress=$address&purpus=$purpose&meetTo=$email'));
      // ignore: unused_local_variable

      // ignore: unused_local_variable
      var response = await post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          body: jsonEncode(body),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
                "key=AAAAqxHc5k4:APA91bHhIMrkwXnJccnxsnPQI4t2YtnfUA44H-Czm7HW4gMMlsrTp6Wy4OP2Ovqa86_z6cRhhOO19zh3q1_N-p-LaQpjSo0BfcpRs8orADeBXtPrkKzwLvwruA8GcdMWPcVgNhM9rzXF"
          });
    } catch (e) {
      log('$e');
    }
  }

  static updateStatus(id, status) {
    firestore
        .collection('ubivisit/ubivisit/visitors')
        .doc(id)
        .update({'status': status}).then((value) => Get.back());
  }

  static timeOut(id) {
    var currDate = DateTime.now();
    String time = DateFormat('jm').format(currDate);
    firestore
        .collection('ubivisit/ubivisit/visitors')
        .doc(id)
        .update({'timeout': time});
  }

  static sendMessage(phone, url) async {
    telephony.sendSmsByDefaultApp(
        to: phone, message: "Your visitor pass for UBIVisit - $url");
  }
}
