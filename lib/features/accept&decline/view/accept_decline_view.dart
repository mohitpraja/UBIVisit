import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/features/accept&decline/controller/accept_decline_controller.dart';

class AcceptDeclineView extends GetView<AcceptDeclineController> {
  const AcceptDeclineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColor.customColor,
      body: Center(
        child: SizedBox(
          height: Get.height*0.35,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: Get.width,
                  height: Get.height * 0.2,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Name : ${controller.visitorData['name']}'),
                          Text('Phone : ${controller.visitorData['phone']}'),
                          Text('Purpose : ${controller.visitorData['purpose']}'),
                        ],
                      )
                      ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: CachedNetworkImage(
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    imageUrl:controller.visitorData['image'],
                    errorWidget: (context, url, error) => CircleAvatar(
                        backgroundColor:Colors.grey.shade300,
                        child: const Icon(
                          Icons.person,
                          size:50,
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              Positioned(
                bottom:Get.height*0.06,
                child: SizedBox(
                  width: Get.width*0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.red),
                            
                          onPressed: () {
                            FBase.updateStatus(controller.visitorData['id'], 'Reject');


                          
                        }, child: const Text('Reject')),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.green),
                          onPressed: () {
                            FBase.updateStatus(controller.visitorData['id'], 'Agree');
                          
                        }, child: const Text('Accept')),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
