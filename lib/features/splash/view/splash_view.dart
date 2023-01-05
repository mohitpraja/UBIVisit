import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../controller/splash_controller.dart';

class SplashPage extends GetView<SplashController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Image.asset(),
          // color: Colors.blue,
          // child: const Center(
          //   child: Text(
          //     'WELCOME',
          //     style: TextStyle(
          //         color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
          //   ),
          // ),
        ));
  }

}