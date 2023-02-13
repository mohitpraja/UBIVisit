import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customtextform.dart';
import 'package:ubivisit/core/components/passwordfield.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/globalfunction.dart';
import 'package:ubivisit/core/global/validation.dart';

class AllEmployeeDataController extends GetxController {
  Stream collectionPathEmp = FBase.firestore
      .collection('ubivisit/ubivisit/users')
      .where('role', isEqualTo: 'employee')
      .where('organization', isEqualTo: FBase.userInfo['organization'])
      .snapshots();
  List userInfo = [];
  showDetails(user) {
    Get.defaultDialog(
        title: '',
        contentPadding: const EdgeInsets.all(0),
        titleStyle: const TextStyle(fontSize: 0),
        titlePadding: const EdgeInsets.all(0),
        content: SizedBox(
          width: Get.width,
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => GlobalFunction.showImg(user['image']),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: CachedNetworkImage(
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          imageUrl: user['image'],
                          errorWidget: (context, url, error) => CircleAvatar(
                              backgroundColor: GlobalColor.customColor,
                              child: const Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['name'],
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        Text(
                          user['post'],
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'Phone - ${user['phone']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Text('Address - ${user['address']}'),
                        Flexible(
                            child: Text(
                          'Email - ${user['email']}',
                          style: const TextStyle(fontSize: 15),
                        )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  deleteUser(id, context) {
    AwesomeDialog(
      context: context,
      title: 'Warning',
      dialogType: DialogType.infoReverse,
      desc: 'Are you sure want to delete this employee',
      btnCancelOnPress: () {},
      btnOkOnPress: () {
        FBase.deleteUser(id, context);
      },
    ).show();
  }

  RxBool isPass = true.obs;
  RxBool isConfirmPass = true.obs;
  showPass() {
    if (isPass.value == true) {
      isPass.value = false;
    } else {
      isPass.value = true;
    }
  }

  showConfirmPass() {
    if (isConfirmPass.value == true) {
      isConfirmPass.value = false;
    } else {
      isConfirmPass.value = true;
    }
  }

  updateUser(user, context) {
    var name = user['name'];
    var email = user['email'];
    var phone = user['phone'];
    var password = user['password'];
    var post = user['post'];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Update User',
            textAlign: TextAlign.center,
          ),
          titlePadding: const EdgeInsets.only(top: 10),
          contentPadding: const EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              height: Get.height * 0.65,
              child: Form(
                  key: Validation.employeeFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFormField(
                        hintText: 'Enter Name',
                        icon: const Icon(Icons.person),
                        initialValue: user['name'],
                        validator: (value){
                          return  Validation.nameValidator(value);
                        },
                        onchanged: (value) => name = value,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter Email',
                        icon: const Icon(Icons.email),
                        inputType: TextInputType.emailAddress,
                        initialValue: user['email'],
                        validator: (value){
                          return  Validation.emailValidator(value);
                        },
                        onchanged: (value) => email = value,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter Phone',
                        icon: const Icon(Icons.phone),
                        inputType: TextInputType.phone,
                        initialValue: user['phone'],
                        validator: (value){
                          return  Validation.phoneValidator(value);
                        },
                        onchanged: (value) => phone = value,
                        maxLength: 10,
                      ),
                      CustomTextFormField(
                        hintText: 'Enter Role',
                        readonly: true,
                        icon: const Icon(Icons.card_travel),
                        initialValue: user['post'],
                        validator: (value){
                          return  Validation.nameValidator(value);
                        },
                        onchanged: (value) => post = value,
                      ),
                      PasswordField(
                        initialValue: user[password],
                        validator: (value){
                          return  Validation.passwordValidator(value);
                        },
                        onchanged: (value) => password = value,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () => Get.back(),
                              child: const Text(
                                'cancel',
                                style: TextStyle(color: Colors.grey),
                              )),
                          TextButton(
                              onPressed: () {
                                if (Validation.employeeFormKey.currentState!
                                    .validate()) {
                                  FBase.updateEmpInfo(context, user['id'], name,
                                      email, phone, post, password);
                                  Get.back();
                                }
                              },
                              child: Text(
                                'Update',
                                style: TextStyle(
                                    color: GlobalColor.customColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      )
                    ],
                  )),
            ),
          ),
        );
      },
    );
  }
}
