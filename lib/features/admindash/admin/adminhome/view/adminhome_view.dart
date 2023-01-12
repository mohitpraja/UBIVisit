import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/routes.dart';

class AdminHomeView extends GetView {
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 60,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: TextStyle(
              fontSize:23, fontFamily: CustomFonts.alata),
        ),
      ),
      drawer: Drawer(
        width: Get.width * 0.75,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: Get.height * 0.2,
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
                            'Your name',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:26,
                                fontFamily: CustomFonts.alata),
                          ),
                          Text(
                            '1234567890',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: CustomFonts.alata),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 25,
                        child: Icon(
                          Icons.person,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.home),
              minLeadingWidth: 5,
              title: Text('Home'),
            ),
            const ListTile(
              leading: Icon(Icons.notes),
              minLeadingWidth: 5,
              title: Text('Visitor List'),
            ),
            const ListTile(
              leading: Icon(Icons.account_circle),
              minLeadingWidth: 5,
              title: Text('Profile'),
            ),
            const ListTile(
              leading: Icon(Icons.play_circle_fill),
              minLeadingWidth: 5,
              title: Text('Tutorial'),
            ),
            const ListTile(
              leading: Icon(Icons.people),
              minLeadingWidth: 5,
              title: Text('Manage Users'),
            ),
            const ListTile(
              leading: Icon(Icons.settings),
              minLeadingWidth: 5,
              title: Text('Settings'),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              minLeadingWidth: 5,
              title: const Text('Logout'),
              onTap: () {
                // dashhomecont.islogout();
              },
            ),
          ],
        ),
      ),
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
                          color: Colors.indigo.shade200,
                        ),
                        margin: const EdgeInsets.all(8),
                        width: Get.width * 0.95,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Your name',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize:20,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    'Admin',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize:17,
                                        fontFamily: CustomFonts.alata),
                                  )
                                ],
                              ),
                              const CircleAvatar(
                                radius: 25,
                                child: Icon(
                                  Icons.person,
                                  size: 28,
                                ),
                              )
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
              top: Get.height * 0.15,
              child: Container(
                  width: Get.width,
                  height: Get.height * 0.65,
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
                        CustomButton(
                          title: 'Add Employee',
                          onPress: () {
                            Get.toNamed(Routes.addemployee);
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            onPressed: () {},
                            
                          
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(
                                  side: BorderSide(color: Colors.indigo)),
                              backgroundColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:10),
                              child: Text(
                                'Add Guard',
                                style: TextStyle(
                                    color: GlobalColor.customColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    fontSize:17,
                                    fontFamily: CustomFonts.alata),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
