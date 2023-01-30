import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ubivisit/core/fbase/firebase.dart';

class GuardHomeController extends GetxController {
  @override
  Future<void> onInit() async {
    var db = await Hive.openBox('ubivisit');
    FBase.userInfo.value = db.get('userInfo');
    loader.value = false;
    super.onInit();
  }

  RxBool loader = true.obs;
  showImg(img,phone) {
    print('cld');
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      content: Column(
        children: [
          Row(
            mainAxisAlignment:MainAxisAlignment.end,
            children: [
              
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.print),
                  label: Text('Print')),
                  TextButton.icon(
                  onPressed: () {
                    FBase.sendMessage(phone, img);
                  },
                  icon: Icon(Icons.share),
                  label: Text('Share')),
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
  RxString searchByName=''.obs;
  List allVisitors = [];
  final Stream visitorStream = FirebaseFirestore.instance
      .collection('ubivisit/ubivisit/visitors')
      .where('timeout', isEqualTo: '')
      .snapshots();
 
}
