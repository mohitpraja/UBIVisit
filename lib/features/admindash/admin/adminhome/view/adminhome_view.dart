import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customdraweradmin.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/global/text_style.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/admindash/admin/adminhome/controller/adminhome_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loader.value?const Center(child: CircularProgressIndicator()):Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                      titleSpacing: 0,
                      toolbarHeight: 60,
                      backgroundColor: GlobalColor.customColor,
                      elevation: 0,
                      title: Text(
                        'Dashboard',
                          style: ThemeText.headingWhite
                      ),
                    ),
                    drawer: const Admindrawer(),

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
                                            style: ThemeText.userHeading
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          FBase.userInfo['post'],
                                            style: ThemeText.heading2Style
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
                                          imageUrl:FBase.userInfo['image'],
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
                        height: Get.height * 0.6,
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
                              CustomButton(title: 'Add Employee', onPress: () {
                                Get.toNamed(Routes.addemployee);
                              },),
                              SizedBox(
                                height: Get.height*0.015,
                              ),
                              CustomButton(title: 'Add Guard',style: TextStyle(color:GlobalColor.customColor),color: Colors.white, onPress: () {
                                Get.toNamed(Routes.addguard);
                              },shape: StadiumBorder(side:BorderSide(color:GlobalColor.customColor)),)
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
        )
    );

  }
}
