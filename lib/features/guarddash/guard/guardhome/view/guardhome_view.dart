import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
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
                  style: TextStyle(fontSize: 23, fontFamily: CustomFonts.alata),
                ),
              ),
              drawer: Drawer(
                width: Get.width * 0.75,
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    SizedBox(
                      height: 160,
                      child: DrawerHeader(
                        decoration: BoxDecoration(
                          color: GlobalColor.customColor,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // FBase.userInfo['name'],
                                    'Hi! ${FBase.userInfo['name'].split(' ').first}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                  Text(
                                    FBase.userInfo['phone'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(75),
                                child: CachedNetworkImage(
                                  width: 60,
                                  height: 60,
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          Get.offAllNamed(Routes.guarddash, arguments: [1]),
                      child: ListTile(
                        leading: const Icon(Icons.home),
                        horizontalTitleGap: 0,
                        title: Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: CustomFonts.alata),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.notes),
                      horizontalTitleGap: 0,
                      title: Text(
                        'Visitor List',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: CustomFonts.alata),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_circle),
                      horizontalTitleGap: 0,
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: CustomFonts.alata),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.play_circle_fill),
                      horizontalTitleGap: 0,
                      title: Text(
                        'Tutorial',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: CustomFonts.alata),
                      ),
                    ),
                    ListTileTheme(
                      horizontalTitleGap: 0,
                      child: ExpansionTile(
                        title: Text(
                          'Setting',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: CustomFonts.alata),
                        ),
                        leading: const Icon(Icons.settings),
                        children: [
                          SizedBox(
                            width: Get.width * 0.5,
                            child: Column(
                              children: [
                                Text(
                                  'Themes',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: CustomFonts.alata),
                                ),
                                const Divider(),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        GlobalColor.customColor = Colors.teal;
                                        GlobalColor.customMaterialColor =
                                            Colors.teal;
                                        Get.back();
                                        Get.offAllNamed(Routes.guarddash);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.teal,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        GlobalColor.customColor =
                                            Colors.deepOrange;
                                        GlobalColor.customMaterialColor =
                                            Colors.deepOrange;
                                        Get.back();
                                        Get.offAllNamed(Routes.guarddash);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.deepOrange,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        GlobalColor.customColor = Colors.blue;
                                        GlobalColor.customMaterialColor =
                                            Colors.blue;
                                        Get.back();
                                        Get.offAllNamed(Routes.guarddash);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.blue,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        GlobalColor.customColor = Colors.green;
                                        GlobalColor.customMaterialColor =
                                            Colors.green;
                                        Get.back();
                                        Get.offAllNamed(Routes.guarddash);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.green,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        GlobalColor.customColor = Colors.pink;
                                        GlobalColor.customMaterialColor =
                                            Colors.pink;
                                        Get.back();
                                        Get.offAllNamed(Routes.guarddash);
                                      },
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                            color: Colors.pink,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      minLeadingWidth: 5,
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: CustomFonts.alata),
                      ),
                      onTap: () async {
                        var pref = await SharedPreferences.getInstance();
                        await pref.setBool('isLogin', false);
                        pref.clear();
                        Hive.deleteBoxFromDisk('ubivisit');
                        GlobalColor.customColor = Colors.indigo;
                        GlobalColor.customMaterialColor = Colors.indigo;
                        Get.offAllNamed(Routes.welcome);
                      },
                    ),
                  ],
                ),
              ),
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
                                          Text(
                                            FBase.userInfo['name'],
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
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
                                                fontSize: 17,
                                                fontFamily: CustomFonts.alata),
                                          )
                                        ],
                                      ),
                                      ClipRRect(
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
                                SizedBox(
                                  height: Get.height * 0.07,
                                  child: TextFormField(
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    decoration: const InputDecoration(
                                        filled: true,
                                        border: InputBorder.none,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15)),
                                            borderSide: BorderSide(
                                                color: Colors.transparent)),
                                        hintText: 'Search by name...'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                  child: StreamBuilder(
                                    stream: controller.visitorStream,
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
                                        return const Center(
                                            child: Text(
                                          'No Recent Updates',
                                          style: TextStyle(fontSize: 16),
                                        ));
                                      }
                                      return ListView.builder(
                                        itemCount:
                                            controller.allVisitors.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            // onTap: () => controller.showDetails(controller.allVisitors[index]),
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
                                                                        FBase.timeOut(controller.allVisitors[index]
                                                                            [
                                                                            'id']);
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
