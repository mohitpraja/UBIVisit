import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/core/routes.dart';

class GuardProfileController extends GetxController{
   @override
  Future<void> onInit() async {
    var db=await Hive.openBox('ubivisit');
    FBase.userInfo.value=db.get('userInfo');
    loader.value=false;
    super.onInit();
  }
  RxBool loader=true.obs;
  var tempUpdate='';
  showBottomSheet(context,fieldname,value,updateField){
    Get.bottomSheet(
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
                  FBase.updateUserInfo(context,updateField, tempUpdate,FBase.userInfo['id'],Routes.guarddash);
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
  choosePic(context){
    Get.bottomSheet(
      SizedBox(
        height: 150,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Choose Profile Picture',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.photo,
                        size: 30,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Gallery'),
                    ],
                  ),
                  onTap: () {

                    selectImage(ImageSource.gallery,context);
                  },
                ),
                const SizedBox(
                  width: 60,
                ),
                InkWell(
                  child: Column(
                    children: const [
                      Icon(
                        Icons.camera,
                        size: 30,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Camera')
                    ],
                  ),
                  onTap: () {
                    selectImage(ImageSource.camera,context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );

  }
  final ImagePicker picker=ImagePicker();
  RxString imagePath=''.obs;
  selectImage(src,context) async {
   final XFile? img=await picker.pickImage(source:src,imageQuality: 80);
   if(img!=null){
    imagePath.value=img.path;
    FBase.uploadImage(File(imagePath.value), FBase.userInfo['id'],context,Routes.guarddash);
    Get.back();
   }


  }
}