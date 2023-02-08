import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/features/manageuser/controller/manageuser_controller.dart';

class ManageUserView extends GetView<ManageUserController> {
  const ManageUserView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Manage Users'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Material(
              color:Colors.grey.shade200,
              child: SizedBox(
                height: 55,
                child: TabBar(
                  tabs: controller.tabs,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: controller.tabPages),
      ),
    );
  }
}
