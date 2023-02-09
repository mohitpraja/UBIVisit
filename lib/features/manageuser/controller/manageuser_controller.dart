import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/features/manageuser/allemployeedata/allemployeedata_view.dart';
import 'package:ubivisit/features/manageuser/allguarddata/allguarddata_view.dart';

class ManageUserController extends GetxController {
  final tabPages = <Widget>[
    const AllEmployeeDataView(),
    const AllGuardDataView(),
  ];
  final tabs = <Tab>[
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
            color: GlobalColor.customColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Employees',
            style: TextStyle(fontSize: Get.width*0.05, color: GlobalColor.customColor),
          )
        ],
      ),
    ),
    Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person,
            color: GlobalColor.customColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Guard',
            style: TextStyle(fontSize: Get.width*0.05, color: GlobalColor.customColor),
          )
        ],
      ),
    ),
  ];
}
