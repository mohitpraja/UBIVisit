import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';

class AdminProfileController extends GetxController{
   @override
  Future<void> onInit() async {
    var db=await Hive.openBox('ubivisit');
    FBase.userInfo.value=db.get('userInfo');
    loader.value=false;
    super.onInit();
  }
  RxBool loader=true.obs;
  var tempUpdate='';
  showBottomSheet(fieldname,value,updateField){
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

              Text('Your $fieldname',style: TextStyle(
                fontFamily:CustomFonts.alata,
                fontSize:18,
                fontWeight: FontWeight.w500
              ),),
              TextFormField(
                autofocus: true,
                initialValue: value,
                style: TextStyle(
                fontFamily:CustomFonts.alata,
                fontSize:17,
                color: Colors.black54,
                fontWeight: FontWeight.w500
              ),
                decoration: const InputDecoration(
                  hintText: 'Enter name',
                ),
                onChanged: (value) => tempUpdate=value,
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
                  FBase.updateUserInfo(updateField, tempUpdate,FBase.userInfo['id']);
                  Get.back();

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