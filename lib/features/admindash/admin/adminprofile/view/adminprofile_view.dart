import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/admindash/admin/adminprofile/controller/adminprofile_controller.dart';

class AdminProfileView extends GetView<AdminProfileController>{
  const AdminProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
            backgroundColor:GlobalColor.customColor,
        title: Text('Profile',style: TextStyle(
          fontFamily: CustomFonts.alata
        ),),
        leading: IconButton(
          onPressed: () => Get.offAllNamed(Routes.admindash),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: GestureDetector(
        onTap: () => Get.focusScope!.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * 0.7,
            margin: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    height: Get.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
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
                              initialValue: 'Admin',
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
                                        controller.showBottomSheet();
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
                                  padding: const EdgeInsets.only(left: 10),
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
                              initialValue: 'Admin',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: CustomFonts.alata),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: const Icon(Icons.card_travel),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.showBottomSheet();
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
                                  padding: const EdgeInsets.only(left: 10),
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
                              initialValue: 'admin@gmail.com',
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
                                        controller.showBottomSheet();
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
                                  padding: const EdgeInsets.only(left: 10),
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
                              initialValue: '123456789',
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
                                        controller.showBottomSheet();
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
    );
  }
}
