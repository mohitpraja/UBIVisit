import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ubivisit/core/components/customloader.dart';

class GlobalFunction {
  static Future checkInternet(context, routename, args) async {
    CustomLoader.showLoader(context);
    if (!(await InternetConnectionChecker().hasConnection)) {
      Get.back();
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        title: 'Warning!!!',
        desc: 'Check internet connection',
      ).show();
    } else {
      Get.back();
      Get.toNamed(routename, arguments: args);
    }
  }
 static showImg(img) {
    Get.defaultDialog(
      title: '',
      backgroundColor: Colors.transparent,
      titleStyle: const TextStyle(fontSize: 0),
      content: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: img,
        errorWidget: (context, url, error) => CircleAvatar(
          backgroundColor: Colors.indigo.shade100,
          backgroundImage: const AssetImage('assets/images/person.png'),
        ),
      ),
    );
  }

  static String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }
  
}
