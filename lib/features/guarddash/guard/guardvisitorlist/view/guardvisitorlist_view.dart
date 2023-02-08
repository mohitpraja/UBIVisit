import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/guarddash/guard/guardvisitorlist/controller/guardvisitorlist_controller.dart';

class GuardVisitorListView extends GetView<GuardVisitorListController> {
  const GuardVisitorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      Customeappbar(onPress: (){
        Get.offAllNamed(Routes.guarddash);
      },title: "Visitor's List",),

      body: StreamBuilder(
        stream: controller.visitorStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data?.docs;
            controller.allVisitors = data!.map((e) => e.data()).toList();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              color: GlobalColor.customColor,
            ));
          }
          if (controller.allVisitors.isEmpty) {
            return const Center(
                child: Text(
              'No Visitor added yet',
              style: TextStyle(fontSize: 16),
            ));
          }
          return ListView.builder(
            itemCount: controller.allVisitors.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () =>
                    // controller.showDetails(controller.allVisitors[index]),
                    controller.showDetails(controller.allVisitors[index]),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: Get.width * 0.97,
                      child: Card(
                          color: Colors.grey.shade100,
                          elevation: 1,
                          child: Container(
                            margin: const EdgeInsets.all(15),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: CachedNetworkImage(
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    imageUrl: controller.allVisitors[index]
                                        ['image'],
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
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Name : ${controller.allVisitors[index]['name']}'),
                                        Text(
                                            'Phone : ${controller.allVisitors[index]['phone']}'),
                                        Text(
                                            'Purpose : ${controller.allVisitors[index]['purpose']}'),
                                        Text(
                                            'To meet : ${controller.allVisitors[index]['tomeet']}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Positioned(
                      top: 10,
                      right: -2,
                      child: Card(
                        color: GlobalColor.customColor,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            controller.allVisitors[index]['date'].toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
