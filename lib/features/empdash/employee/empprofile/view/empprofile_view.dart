import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customlisttile.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/empdash/employee/empprofile/controller/empprofile_controller.dart';

class EmpProfileView extends GetView<EmpProfileController> {
  const EmpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Obx(() => controller.loader.value
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
                  onPressed: () => Get.offAllNamed(Routes.empdash),
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
              body: GestureDetector(
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
                                ? InkWell(
                                    onTap: () => GlobalFunction.showImg(
                                        controller.imagePath.value),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: Image.file(
                                          File(controller.imagePath.value),
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        )),
                                  )
                                : InkWell(
                                    onTap: () => GlobalFunction.showImg(
                                        FBase.userInfo['image']),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(75),
                                      child: CachedNetworkImage(
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        imageUrl: FBase.userInfo['image'],
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                          backgroundColor:
                                              Colors.indigo.shade100,
                                          backgroundImage: const AssetImage(
                                              'assets/images/person.png'),
                                        ),
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
                                      borderRadius: BorderRadius.circular(20)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Post',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: CustomFonts.alata),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomListTile(
                                      text: FBase.userInfo['post'],
                                      leading: const Icon(Icons.card_travel),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Name',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: CustomFonts.alata),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomListTile(
                                        text: FBase.userInfo['name'],
                                        leading: const Icon(Icons.person),
                                        trailing: IconButton(
                                          onPressed: () {
                                            controller.showBottomSheet(
                                                context,
                                                'Name',
                                                FBase.userInfo['name'],
                                                'name');
                                          },
                                          icon: const Icon(Icons.edit),
                                        ))
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Email',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: CustomFonts.alata),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomListTile(
                                        text: FBase.userInfo['email'],
                                        leading: const Icon(Icons.email),
                                        trailing: IconButton(
                                            onPressed: () {
                                              controller.showBottomSheet(
                                                  context,
                                                  'Email',
                                                  FBase.userInfo['email'],
                                                  'email');
                                            },
                                            icon: const Icon(Icons.edit))),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Phone',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: CustomFonts.alata),
                                          ),
                                        ),
                                      ],
                                    ),
                                    CustomListTile(
                                        text: FBase.userInfo['phone'],
                                        leading: const Icon(Icons.phone),
                                        trailing: IconButton(
                                            onPressed: () {
                                              controller.showBottomSheet(
                                                  context,
                                                  'Phone number',
                                                  FBase.userInfo['phone'],
                                                  'phone');
                                            },
                                            icon: const Icon(Icons.edit))),
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
              ),
            )),
    );
  }
}
