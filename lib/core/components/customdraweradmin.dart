import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/routes.dart';


class Admindrawer extends GetView {
  const Admindrawer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                          'Hi! ${FBase.userInfo['name'].split(' ').first}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Get.height*0.035,
                              fontFamily: CustomFonts.alata),
                        ),
                        Text(
                          FBase.userInfo['phone'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Get.height*0.02,
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
                  ],
                ),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.person_add_alt_1),
            horizontalTitleGap: 0,
            title: Text(
              'Edit Profile',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: CustomFonts.alata),
            ),
          ),

          GestureDetector(
            onTap: () => Get.toNamed(Routes.manageuser),
            child: ListTile(
              leading: const Icon(Icons.people),
              horizontalTitleGap: 0,
              title: Text(
                'Manage Users',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: CustomFonts.alata),
              ),
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
                              Get.offAllNamed(Routes.admindash);
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
                              Get.offAllNamed(Routes.admindash);
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
                              Get.offAllNamed(Routes.admindash);
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
                              Get.offAllNamed(Routes.admindash);
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
                              Get.offAllNamed(Routes.admindash);
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
              GlobalColor.customColor=Colors.indigo;
              GlobalColor.customMaterialColor=Colors.indigo;
              Get.offAllNamed(Routes.welcome);
            },
          ),
        ],
      ),
    );

  }
}

