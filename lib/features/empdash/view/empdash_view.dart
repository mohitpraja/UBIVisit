import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/features/empdash/controller/empdash_controller.dart';

class EmpDashView extends GetView <EmpDashController>{
  const EmpDashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
             body: controller.adminallpages[controller.selectedindex.value],
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.white,
                color:GlobalColor.customColor,
                onTap: (value) {
                  controller.selectIndex(value);
                },
                items: [
                  Icon(
                    Icons.home,
                    size:Get.height*0.04,
                    color: Colors.white,
              ),
              Icon(
                Icons.list,
                size:Get.height*0.04,
                color: Colors.white,
              ),
              Icon(
                Icons.person,
                size:Get.height*0.04,
                color: Colors.white,
              ),
            ],
          ), 
        )
    );
  }
}
