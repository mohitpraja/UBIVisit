import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customdrawer.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/global/text_style.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/guarddash/guard/guardhome/controller/guardhome_controller.dart';

class GuardHomeView extends GetView<GuardHomeController> {
  const GuardHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loader.value
        ? const Center(child: CircularProgressIndicator())
        : GestureDetector(
            onTap: () => Get.focusScope!.unfocus(),
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                titleSpacing: 0,
                toolbarHeight: 60,
                backgroundColor: GlobalColor.customColor,
                elevation: 0,
                title: Text(
                  'Dashboard',
                  style: ThemeText.headingWhite,
                ),
              ),
              drawer: const Guarddrawer(),
              body: SizedBox(
                height: Get.height,
                child: Stack(
                  children: [
                    Container(
                      height: Get.height * 0.24,
                      color: GlobalColor.customColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white54,
                                ),
                                margin: const EdgeInsets.all(8),
                                width: Get.width * 0.9,
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(FBase.userInfo['name'],
                                              style: ThemeText.userHeading),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            FBase.userInfo['post'],
                                            style: ThemeText.heading2Style,
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () => GlobalFunction.showImg(
                                            FBase.userInfo['image']),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(75),
                                          child: CachedNetworkImage(
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            imageUrl: FBase.userInfo['image'],
                                            errorWidget: (context, url,
                                                    error) =>
                                                CircleAvatar(
                                                    backgroundColor:
                                                        GlobalColor.customColor,
                                                    child: const Icon(
                                                      Icons.person,
                                                      size: 35,
                                                      color: Colors.white,
                                                    )),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: Get.height * 0.16,
                      child: Container(
                          width: Get.width,
                          height: Get.height * 0.57,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomButton(
                                  title: 'Add Visitor',
                                  onPress: () {
                                    Get.toNamed(Routes.addvisitor);
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: StreamBuilder(
                                    stream: controller.searchByName.value == ''
                                        ? FirebaseFirestore.instance
                                            .collection(
                                                'ubivisit/ubivisit/visitors')
                                            .where('timeout', isEqualTo: '')
                                            .where('organization',
                                                isEqualTo: FBase
                                                    .userInfo['organization'])
                                            .snapshots()
                                        : FirebaseFirestore.instance
                                            .collection(
                                                'ubivisit/ubivisit/visitors')
                                            .where('timeout', isEqualTo: '')
                                            .where('name',
                                                isLessThanOrEqualTo: controller
                                                    .searchByName.value)
                                            .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final data = snapshot.data?.docs;
                                        controller.allVisitors =
                                            data!.map((e) => e.data()).toList();
                                      }
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Center(
                                            child: CircularProgressIndicator(
                                          backgroundColor: Colors.white,
                                          color: GlobalColor.customColor,
                                        ));
                                      }
                                      if (controller.allVisitors.isEmpty) {
                                        return Center(
                                            child: Text('No Recent Updates',
                                                style:
                                                    ThemeText.heading2Style));
                                      }
                                      return ListView.builder(
                                        itemCount:
                                            controller.allVisitors.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () => controller.showImg(
                                                controller.allVisitors[index]
                                                    ['qr'],
                                                controller.allVisitors[index]
                                                    ['phone']),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                SizedBox(
                                                  width: Get.width * 0.97,
                                                  child: Card(
                                                      color:
                                                          Colors.grey.shade100,
                                                      elevation: 1,
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(15),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              75),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    width: 60,
                                                                    height: 60,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    imageUrl: controller
                                                                            .allVisitors[index]
                                                                        [
                                                                        'image'],
                                                                    errorWidget: (context,
                                                                            url,
                                                                            error) =>
                                                                        CircleAvatar(
                                                                            backgroundColor:
                                                                                GlobalColor.customColor,
                                                                            child: const Icon(
                                                                              Icons.person,
                                                                              size: 35,
                                                                              color: Colors.white,
                                                                            )),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    margin: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                            'Name : ${controller.allVisitors[index]['name']}'),
                                                                        Text(
                                                                            'Phone : ${controller.allVisitors[index]['phone']}'),
                                                                        Text(
                                                                            'Purpose : ${controller.allVisitors[index]['purpose']}'),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          children: [
                                                                            Text('${controller.allVisitors[index]['status']}')
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 3,
                                                            ),
                                                            SizedBox(
                                                              width: Get.width,
                                                              child:
                                                                  ElevatedButton(
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: GlobalColor
                                                                              .customColor),
                                                                      onPressed:
                                                                          () {
                                                                        FBase.timeOut(FBase.timeOut(controller.allVisitors[index]
                                                                            [
                                                                            'id']));
                                                                        // if (FBase.timeOut(controller.allVisitors[index]
                                                                        //     [
                                                                        //     'id'])) {
                                                                        //   CustomSnackbar(title: 'success', msg: 'successfully Timeout ')
                                                                        //       .show();
                                                                        // } else {
                                                                        //   return CustomSnackbar(title: 'sorry', msg: "Couldn't Timeout ")
                                                                        //       .show();
                                                                        // }
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Time out',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold),
                                                                      )),
                                                            )
                                                          ],
                                                        ),
                                                      )),
                                                ),
                                                Positioned(
                                                    right: Get.width * 0.05,
                                                    top: Get.width * 0.05,
                                                    child: GestureDetector(
                                                      onTap: () => controller
                                                          .scanTimeOut(),
                                                      child: const CircleAvatar(
                                                        child: Icon(CupertinoIcons
                                                            .camera_viewfinder),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ));
  }
}
