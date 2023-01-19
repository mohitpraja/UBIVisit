import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/validation.dart';

class AllEmployeeDataController extends GetxController {
  List userInfo = [];
  showDetails(user) {
    Get.defaultDialog(
        title: '',
        contentPadding: const EdgeInsets.all(0),
        titleStyle: const TextStyle(fontSize: 0),
        titlePadding: const EdgeInsets.all(0),
        content: SizedBox(
          height: Get.height * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Employee Detals'),
              ClipRRect(
                borderRadius: BorderRadius.circular(75),
                child: CachedNetworkImage(
                  width: 70,
                  height: 70,
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
              Text('name: ${user['name']}'),
              Text('email: ${user['email']}'),
              Text('phone: ${user['phone']}'),
              Text('post: ${user['post']}'),
            ],
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
    showDialog(context: context, 
    builder: (context) {
    return  AlertDialog(
      title: const Text('Update User',textAlign: TextAlign.center,),
      titlePadding: const EdgeInsets.only(top: 15),
      contentPadding: const EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          height: Get.height * 0.6,
          child: Form(
              key: Validation.employeeFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.black54),
                    initialValue: user['name'],
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black54),
                        hintText: 'Enter name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Name required'),
                      PatternValidator(RegExp(r'^[a-z A-Z]+$').pattern,
                          errorText: 'Invalid name')
                    ]),
                    onChanged: (value) => name = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    initialValue: user['email'],
                    style: const TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black54),
                        hintText: 'Enter email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Email required'),
                      PatternValidator(
                          RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .pattern,
                          errorText: 'Invalid email')
                    ]),
                    onChanged: (value) => email = value,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    initialValue: user['phone'],
                    maxLength: 10,
                    style: const TextStyle(color: Colors.black54),
                    decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black54),
                        hintText: 'Enter Phone Number ',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Phone number required'),
                      PatternValidator(RegExp(r'^[0-9]{10}$').pattern,
                          errorText: 'Invalid number')
                    ]),
                    onChanged: (value) => phone = value,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.black54),
                    initialValue: user['post'],
                    decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.black54),
                        hintText: 'Role ',
                        prefixIcon: const Icon(Icons.card_travel),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Role required'),
                      PatternValidator(RegExp(r'^[a-z A-Z]+$').pattern,
                          errorText: 'Invalid Role')
                    ]),
                    onChanged: (value) => post = value,
                  ),
                  Obx(() => TextFormField(
                        style: const TextStyle(color: Colors.black54),
                        obscureText: isPass.value,
                        initialValue: user['password'],
                        decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(color: Colors.black54),
                            hintText: 'Enter Password',
                            suffixIcon: IconButton(
                                onPressed: () => showPass(),
                                icon: isPass.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)),
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: MultiValidator([
                          MinLengthValidator(6,
                              errorText:
                                  'password must be at least 6 digits long'),
                          RequiredValidator(errorText: 'Password requied'),
                          PatternValidator(
                              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{6,}$')
                                  .pattern,
                              errorText:
                                  "Password doesn't match the format : Abc@123")
                        ]),
                        onChanged: (value) => password = value,
                      )),
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