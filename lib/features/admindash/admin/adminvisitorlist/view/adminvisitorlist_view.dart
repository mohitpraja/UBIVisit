import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/global/global.dart';
import 'package:visitantapp/features/admindash/admin/adminvisitorlist/controller/adminvisitorlist_controller.dart';

class AdminVisitorListView extends GetView<AdminVisitorListController> {
  const AdminVisitorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor:GlobalColor.customColor,

        title: const Text("Visitor's List"),
      ),
      body: Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Stack(
                children: [


                  SizedBox(
                    height: 150,
                    width: 500,
                    child: Card(
                      margin: const EdgeInsets.all(5),
                      elevation: 30,
                      color: Colors.black12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 60,
                            child: Icon(
                              Icons.camera_enhance_outlined,
                              color: Colors.white10,
                              size: 80,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [Text('Name :'), Text('xyz')],
                              ),
                              Row(
                                children: const [
                                  Text('Purpose :'),
                                  Text('for internship')
                                ],
                              ),
                              Row(
                                children: const [Text('Meet to :'), Text('demo')],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    left: 240,
                    top: 10,
                    child: Container(
                      height: 30,
                      width: 80,
                      color: Colors.indigo,
                      child: const Text("08-01-2023",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
