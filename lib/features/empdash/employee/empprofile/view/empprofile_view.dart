import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/empdash/employee/empprofile/controller/empprofile_controller.dart';

class EmpProfileView extends GetView<EmpProfileController> {
  const EmpProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loader.value
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
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.indigo.shade100,
                            backgroundImage:
                                const AssetImage('assets/images/person.png'),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            child: InkWell(
                              onTap: () {},
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
                                  TextFormField(
                                    readOnly: true,
                                    initialValue: FBase.userInfo['post'],
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
                                  TextFormField(
                                    readOnly: true,
                                    initialValue: FBase.userInfo['name'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(Icons.person),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.showBottomSheet(
                                                  'Name',
                                                  FBase.userInfo['name'],
                                                  'name');
                                            },
                                            icon: const Icon(Icons.edit))),
                                  )
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
                                  TextFormField(
                                    readOnly: true,
                                    initialValue: FBase.userInfo['email'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(Icons.email),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.showBottomSheet(
                                                  'Email',
                                                  FBase.userInfo['email'],
                                                  'email');
                                            },
                                            icon: const Icon(Icons.edit))),
                                  )
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
                                  TextFormField(
                                    readOnly: true,
                                    initialValue: FBase.userInfo['phone'],
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        prefixIcon: const Icon(Icons.phone),
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              controller.showBottomSheet(
                                                  'Phone number',
                                                  FBase.userInfo['phone'],
                                                  'phone');
                                            },
                                            icon: const Icon(Icons.edit))),
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
            ),
          ));
  }
}