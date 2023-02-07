import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';

class AdminVisitorListController extends GetxController{
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
        content: SizedBox(
          width: Get.width,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                       onTap: () => GlobalFunction.showImg(user['image']),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: CachedNetworkImage(
                          width: 60,
                          height: 60,
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
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name'],
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          user['phone'],
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'Address - ${user['address']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'Purpose - ${user['purpose']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'To meet - ${user['tomeet']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'Date - ${user['date']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'Time in - ${user['time']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'Time out - ${user['timeout']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }





}