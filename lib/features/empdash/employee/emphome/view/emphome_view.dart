import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customdrawer.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/empdash/employee/emphome/controller/emphome_controller.dart';

class EmpHomeView extends GetView<EmpHomeController> {
  const EmpHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loader.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              titleSpacing: 0,
              toolbarHeight: 60,
              backgroundColor: GlobalColor.customColor,
              elevation: 0,
              title: Text(
                'Dashboard',
                style: TextStyle(fontSize: Get.height*0.03, fontFamily: CustomFonts.alata),
              ),
            ),
             drawer: const Guarddrawer(),

            body: SizedBox(
              width: Get.width,
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
                                        Text(
                                          FBase.userInfo['name'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontSize: Get.height*0.028,
                                              fontFamily: CustomFonts.alata),
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          FBase.userInfo['post'],
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontSize:  Get.height*0.022,
                                              fontFamily: CustomFonts.alata),
                                        )
                                      ],
                                    ),
                                    InkWell(
                                      onTap: () => GlobalFunction.showImg(FBase.userInfo['image']),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: CachedNetworkImage(
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover,
                                          imageUrl: FBase.userInfo['image'],
                                          errorWidget: (context, url, error) =>
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
                                height: 15,
                              ),
                              Expanded(
                                child: StreamBuilder(
                                  stream: controller.visitorStream,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      controller.allVisitors.clear();
                                      final data = snapshot.data?.docs;
                                      data!.map((e) {
                                        if (e.data()['tomeet'] ==
                                            FBase.userInfo['name']) {
                                          controller.allVisitors.add(e.data());
                                        }
                                      }).toList();
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
                                      return const Center(
                                          child: Text(
                                        'No Visitor added yet',
                                        style: TextStyle(fontSize: 16),
                                      ));
                                    }
                                    return ListView.builder(
                                      itemCount: controller.allVisitors.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () => Get.toNamed(
                                              Routes.acceptdecline,
                                              arguments: controller
                                                  .allVisitors[index]),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                width: Get.width * 0.97,
                                                child: Card(
                                                    color: Colors.grey.shade100,
                                                    elevation: 1,
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              15),
                                                      child: Row(
                                                        children: [
                                                          InkWell(
                                                            onTap: () => GlobalFunction.showImg(controller
                                                                        .allVisitors[
                                                                    index]['image']),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          75),
                                                              child:
                                                                  CachedNetworkImage(
                                                                width: 60,
                                                                height: 60,
                                                                fit: BoxFit.cover,
                                                                imageUrl: controller
                                                                        .allVisitors[
                                                                    index]['image'],
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    CircleAvatar(
                                                                        backgroundColor:
                                                                            GlobalColor
                                                                                .customColor,
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .person,
                                                                          size:
                                                                              35,
                                                                          color: Colors
                                                                              .white,
                                                                        )),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 15),
                                                              child: Column(
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
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                              ),
                                              Positioned(
                                                top: 10,
                                                right: -2,
                                                child: Card(
                                                  color:
                                                      GlobalColor.customColor,
                                                  elevation: 3,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: Text(
                                                      controller
                                                          .allVisitors[index]
                                                              ['date']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          ));
  }
}
