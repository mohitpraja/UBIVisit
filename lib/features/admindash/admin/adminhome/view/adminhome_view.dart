import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/components/custombutton.dart';
import 'package:visitantapp/core/global/customfont.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/admindash/admin/adminhome/controller/adminhome_controller.dart';

class AdminHomeView extends GetView <AdminHomeController>{
  const AdminHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: 60,
            backgroundColor:GlobalColor.customColor,
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
                            'Your name',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
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
            ListTile(
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
            ListTile(
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
                    width: Get.width*0.5,
                    child: Column(
                      children: [
                      Text('Themes', style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontFamily: CustomFonts.alata),),
                      const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {

                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Icon(
                                  Icons.sunny,
                                  color: Colors.black54,
                                )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 0.2),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                    child: Icon(
                                  Icons.dark_mode,
                                  color: Colors.black54,
                                )),
                              ),
                            )
                          ],
                        ),
                         const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            GlobalColor.customColor=Colors.teal;
                            GlobalColor.customMaterialColor=Colors.teal;
                            Get.back();
                            Get.offAllNamed(Routes.admindash);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.teal, shape: BoxShape.circle),
                          ),
                        ),
                        InkWell(
                           onTap: () {
                            GlobalColor.customColor=Colors.deepOrange;
                            GlobalColor.customMaterialColor=Colors.deepOrange;
                             Get.back();
                            Get.offAllNamed(Routes.admindash,predicate:(route) =>false,);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.deepOrange, shape: BoxShape.circle),
                          ),
                        ),
                        InkWell(
                           onTap: () {
                            GlobalColor.customColor=Colors.blue;
                            GlobalColor.customMaterialColor=Colors.blue;
                              Get.back();
                            Get.offAllNamed(Routes.admindash);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                          ),
                        ),
                        InkWell(
                           onTap: () {
                            GlobalColor.customColor=Colors.green;
                            GlobalColor.customMaterialColor=Colors.green;
                             Get.back();
                            Get.offAllNamed(Routes.admindash);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                        ),
                        InkWell(
                           onTap: () {
                            GlobalColor.customColor=Colors.pink;
                            GlobalColor.customMaterialColor=Colors.pink;
                             Get.back();
                            Get.offAllNamed(Routes.admindash);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                color: Colors.pink, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
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
                          color: Colors.white54,
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
                                        fontSize: 20,
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
                                        fontSize: 17,
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
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Add Guard',
                                style: TextStyle(
                                    color: GlobalColor.customColor,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                    fontSize: 17,
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
