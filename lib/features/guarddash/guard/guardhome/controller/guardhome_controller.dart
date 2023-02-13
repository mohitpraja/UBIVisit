import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ubivisit/core/components/customsnackbar.dart';
import 'package:ubivisit/core/fbase/firebase.dart';

class GuardHomeController extends GetxController {
  @override
  Future<void> onInit() async {
    var db = await Hive.openBox('ubivisit');
    loader.value = false;
    FBase.userInfo.value = db.get('userInfo');
    super.onInit();
  }

  RxBool loader = true.obs;
  showImg(img, phone) {
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      content: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.print),
                  label: const Text('Print')),
              TextButton.icon(
                  onPressed: () {
                    FBase.sendMessage(phone, img);
                  },
                  icon: const Icon(Icons.share),
                  label: const Text('Share')),
            ],
          ),
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: img,
            errorWidget: (context, url, error) => CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              backgroundImage: const AssetImage('assets/images/person.png'),
            ),
          ),
        ],
      ),
    );
  }

  RxString searchByName = ''.obs;
  List allVisitors = [];
  final Stream visitorStream = FirebaseFirestore.instance
      .collection('ubivisit/ubivisit/visitors')
      .where('timeout', isEqualTo: '')
      .snapshots();
  scanTimeOut() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Cancel", false, ScanMode.DEFAULT);

    var scanData = jsonDecode(barcodeScanRes);
    FBase.timeOut(scanData['id']).then((value) {
      CustomSnackbar(title: 'Success', msg: 'Timeout Market Successfully')
          .show();
    });
  }
}
