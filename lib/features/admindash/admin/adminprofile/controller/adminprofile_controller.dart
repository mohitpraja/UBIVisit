import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/global/customfont.dart';

class AdminProfileController extends GetxController{
  showBottomSheet(){
    Get.bottomSheet(
      // barrierColor: Colors.transparent,
      Container(
          color: Colors.white,
        child: Container(
          margin: const EdgeInsets.all(15),
          height: Get.height*0.18,
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Text('Your Name',style: TextStyle(
                fontFamily:CustomFonts.alata,
                fontSize:18,
                fontWeight: FontWeight.w500
              ),),
              TextFormField(
                autofocus: true,
                initialValue: 'Admin',
                style: TextStyle(
                fontFamily:CustomFonts.alata,
                fontSize:17,
                color: Colors.black54,
                fontWeight: FontWeight.w500
              ),
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                TextButton(onPressed: () => Get.back(), child: Text('cancel',style: TextStyle(
                fontFamily:CustomFonts.alata,
                fontSize:17,
                color: Colors.black54,
                fontWeight: FontWeight.w500
              ),)),
                TextButton(onPressed: () {

                }, child: Text('Save',style: TextStyle(
                fontFamily:CustomFonts.alata,
                fontSize:17,
                fontWeight: FontWeight.w500
              ),))
              ],)
            ],
          )
        ),
      )
    );
  }
  
}