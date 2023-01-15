import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/features/accept&decline/controller/accept_decline_controller.dart';


class AcceptDeclineView extends GetView<AcceptDeclineController> {
  const AcceptDeclineView ({super.key});



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor:Colors.indigo,
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.indigo,
        width: double.infinity,height: 900,
        child: Stack(
            children: [
              Positioned(left:25, top:270,
                child: Container(
                  height: Get.height*6,
                  width: Get.width*6,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  constraints: const BoxConstraints(maxHeight: 250,maxWidth: 350),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  const [
                      Text("Name : XYZ"),
                      SizedBox(height: 4,),
                      Text("Purpose : For interview"),
                      SizedBox(height: 4,),
                      Text("Phone : 1234567890",),
                      SizedBox(height: 4,),
                      Text("Read more....",
                        style: TextStyle(
                          color: Colors.indigo,fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),),],
                  ),
                ),

              ),
              const Positioned(
                top: 220, left:145,
                child:  CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white24,
                    size: 80,
                  ),
                ),),
                 Positioned(  top: 490, left:40,
                     child: ElevatedButton(
                       style: ButtonStyle(
                         shape: MaterialStateProperty.all(RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(20),
                         ),),
                         padding: MaterialStateProperty.all
                           (const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),),
                         backgroundColor: MaterialStateProperty.all(Colors.green),
                       ),
                       onPressed: (){

                       },
                       child: const Text("Accept",
                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                           color:Colors.white, ),),
                     ),),

              Positioned(  top: 490, left:245,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),),
                    padding: MaterialStateProperty.all
                      (const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: (){

                  },
                  child: const Text("Decline",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
                      color:Colors.white, ),),
                ),),
            ]
        ),
      ),



      // body: Container(
      //     height: Get.height*0.34,
      //       width: Get.width*0.9,
      //       color: Colors.white,
      //       margin:  EdgeInsets.only(left: 20, top: 280),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children:  [
      //          const SizedBox(height: 80,),
      //            Text("Name : XYZ"),
      //          const SizedBox(height: 4,),
      //          Text("Purpose : For interview"),
      //         const  SizedBox(height: 4,),
      //         Text("Phone : 1234567890",),
      //         const  SizedBox(height: 4,),
      //           Text("Read more....",
      //             style: TextStyle(
      //               color: Colors.indigo,fontWeight: FontWeight.bold,
      //               fontSize: 20,
      //             ),),
      //           const  SizedBox(height: 62,),
      //
      //         Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //
      //             children: [
      //           ElevatedButton(
      //             style: ButtonStyle(
      //               shape: MaterialStateProperty.all(RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(20),
      //               ),),
      //               padding: MaterialStateProperty.all
      //                 ( EdgeInsets.symmetric(vertical: 10, horizontal: 10,),),
      //               backgroundColor: MaterialStateProperty.all(Colors.red),
      //             ),
      //
      //             onPressed:(){},
      //             child:   Text("Decline",
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
      //                 color:Colors.white, ),),),
      //
      //           ElevatedButton(
      //             style: ButtonStyle(
      //               shape: MaterialStateProperty.all(RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(20),
      //               ),),
      //               padding: MaterialStateProperty.all
      //                 (const EdgeInsets.symmetric(vertical: 10, horizontal: 10,),),
      //               backgroundColor: MaterialStateProperty.all(Colors.green),
      //             ),
      //
      //
      //             onPressed:(){},
      //             child:  const Text("Accept",
      //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,
      //                 color:Colors.white, ),),),
      //         ]),
      //           ],
      //       ),
      //       ),

    );
  }
}

