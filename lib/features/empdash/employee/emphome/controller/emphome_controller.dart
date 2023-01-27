
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';

class EmpHomeController extends GetxController {
  @override
  Future<void> onInit() async {
    var db=await Hive.openBox('ubivisit');
    FBase.userInfo.value=db.get('userInfo');
    loader.value=false;
    super.onInit();
  }
  RxBool loader=true.obs;
  RxString name = '${FBase.userInfo['name'].split(' ').first}'.obs;
  List allVisitors = [];
  final Stream visitorStream = FirebaseFirestore.instance
      .collection('ubivisit/ubivisit/visitors')
      .snapshots();
  showDetails(user) {
    Get.defaultDialog(
        title: '',
        contentPadding: const EdgeInsets.all(0),
        titleStyle: const TextStyle(fontSize: 0),
        titlePadding: const EdgeInsets.all(0),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Visitor Details',
                style: TextStyle(fontSize: 18),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: CachedNetworkImage(
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  imageUrl: user['image'],
                  errorWidget: (context, url, error) => CircleAvatar(
                      backgroundColor: GlobalColor.customColor,
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
              ),
              Text(
                'Name: ${user['name']}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Phone: ${user['phone']}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Date: ${user['date']}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Address: ${user['address']}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Purpose: ${user['purpose']}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'To Meet: ${user['tomeet']}',
                style: const TextStyle(fontSize: 14),
              ),
              Text(
                'Time in: ${user['time']}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ));
  }



    
 
}
