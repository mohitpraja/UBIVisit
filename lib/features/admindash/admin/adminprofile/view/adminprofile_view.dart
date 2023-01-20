import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/admindash/admin/adminprofile/controller/adminprofile_controller.dart';

class AdminProfileView extends GetView<AdminProfileController> {
  const AdminProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loader.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: GlobalColor.customColor,
                title: Text(
                  'Profile',
                  style: TextStyle(fontFamily: CustomFonts.alata),
                ),
                leading: IconButton(
                  onPressed: () => Get.offAllNamed(Routes.admindash),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: StreamBuilder(
                stream: FBase.getUserInfo(FBase.userInfo['id']),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.userInfo=snapshot.data.docs;
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: GlobalColor.customColor,
                    ));
                  }
                  return GestureDetector(
                    onTap: () => Get.focusScope!.unfocus(),
                    child: SingleChildScrollView(
                      child: Container(
                        height: Get.height * 0.8,
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Stack(
                              children: [
                                controller.imagePath.value != ''
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: Image.file(
                                          File(controller.imagePath.value),
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        ))
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: CachedNetworkImage(
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                          imageUrl: controller.userInfo[0]['image'],
                                          errorWidget: (context, url, error) =>
                                              CircleAvatar(
                                            backgroundColor:
                                                Colors.indigo.shade100,
                                            backgroundImage: AssetImage(
                                                'assets/images/person.png'),
                                          ),
                                        ),
                                      ),
                                Positioned(
                                  bottom: 5,
                                  right: 0,
                                  child: InkWell(
                                    onTap: () {
                                      controller.choosePic(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: GlobalColor.customColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 28,
                                      height: 28,
                                      child: const Icon(
                                        CupertinoIcons.camera,
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Form(
                              child: SizedBox(
                                height: Get.height * 0.45,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                'Post',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        CustomFonts.alata),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextFormField(
                                          readOnly: true,
                                          initialValue: controller.userInfo[0]['post'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: CustomFonts.alata),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            prefixIcon: Icon(Icons.card_travel),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                'Name',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        CustomFonts.alata),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextFormField(
                                          readOnly: true,
                                          initialValue: controller.userInfo[0]['name'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: CustomFonts.alata),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon:
                                                  const Icon(Icons.person),
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    controller.showBottomSheet(
                                                        'Name',
                                                        controller.userInfo[0]['name'],
                                                        'name');
                                                  },
                                                  icon:
                                                      const Icon(Icons.edit))),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                'Email',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        CustomFonts.alata),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextFormField(
                                          readOnly: true,
                                          initialValue: controller.userInfo[0]['email'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: CustomFonts.alata),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon:
                                                  const Icon(Icons.email),
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    controller.showBottomSheet(
                                                        'Email',
                                                        controller.userInfo[0]['email'],
                                                        'email');
                                                  },
                                                  icon:
                                                      const Icon(Icons.edit))),
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: Text(
                                                'Phone',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        CustomFonts.alata),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextFormField(
                                          readOnly: true,
                                          initialValue: controller.userInfo[0]['phone'],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: CustomFonts.alata),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              prefixIcon:
                                                  const Icon(Icons.phone),
                                              suffixIcon: IconButton(
                                                  onPressed: () {
                                                    controller.showBottomSheet(
                                                        'Phone number',
                                                        controller.userInfo[0]['phone'],
                                                        'phone');
                                                  },
                                                  icon:
                                                      const Icon(Icons.edit))),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
    );
  }
}
