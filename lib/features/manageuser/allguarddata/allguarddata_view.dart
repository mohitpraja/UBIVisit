import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/features/manageuser/allguarddata/allguarddata_controller.dart';

class AllGuardDataView extends GetView<AllGuardDataController>{
  const AllGuardDataView({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: controller.collectionPathGuard,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data?.docs;
                  controller.userInfo = data!.map((e) => e.data()).toList();
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    color: GlobalColor.customColor,
                  ));
                }
                 if (controller.userInfo.isEmpty) {
            return const Center(child: Text('No guard added yet'));
          }
                return ListView.builder(
                  itemCount: controller.userInfo.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.showDetails(controller.userInfo[index]);
                      },
                      child: Card(
                        color: Colors.grey.shade100,
                        elevation: 1,
                        child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(75),
                                  child: CachedNetworkImage(
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                    imageUrl: controller.userInfo[index]
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
                                            controller.userInfo[index]['name']),
                                        Text(controller.userInfo[index]
                                            ['phone']),
                                        Text(
                                            controller.userInfo[index]['post']),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        controller.updateUser(controller.userInfo[index],context);
                                      },
                                      icon: const Icon(
                                          Icons.edit),
                                      color: Colors.green,
                                    ),
                                    const SizedBox(
                                      width: 2,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.deleteUser(
                                            controller.userInfo[index]['id'],
                                            context);
                                      },
                                      icon: const Icon(
                                          CupertinoIcons.delete_simple),
                                      color: Colors.deepOrange,
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

}