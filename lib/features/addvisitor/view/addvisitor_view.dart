import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/custombutton.dart';
import 'package:ubivisit/core/components/customscroll.dart';
import 'package:ubivisit/core/global/global.dart';
import 'package:ubivisit/core/global/validation.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/addvisitor/controller/addvisitor_controller.dart';

class AddvisitorView extends GetView<AddvisitorController> {
  const AddvisitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loader.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                'Add Visitor Details',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              elevation: 0,
              leading: IconButton(
                onPressed: () => Get.toNamed(Routes.guarddash),
                icon: const Icon(Icons.arrow_back),
                color: Colors.black54,
              ),
            ),
            body: GestureDetector(
              onTap: () => Get.focusScope!.unfocus(),
              child: ScrollConfiguration(
                behavior: CustomScroll(),
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      height: Get.height * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => controller.selectImage(context),
                            child: controller.imagePath.value != ''
                                ? Material(
                                    shape: CircleBorder(
                                        side: BorderSide(
                                            color: GlobalColor.customColor)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(75),
                                        child: Image.file(
                                          File(controller.imagePath.value),
                                          width: 120,
                                          height: 120,
                                          fit: BoxFit.cover,
                                        )),
                                  )
                                : Material(
                                    shape: CircleBorder(
                                        side: BorderSide(
                                            color: GlobalColor.customColor)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(75),
                                      child: CachedNetworkImage(
                                        width: 120,
                                        height: 120,
                                        fit: BoxFit.cover,
                                        imageUrl: '',
                                        errorWidget: (context, url, error) =>
                                            CircleAvatar(
                                          backgroundColor:
                                              Colors.indigo.shade100,
                                          backgroundImage: const AssetImage(
                                              'assets/images/camera.jpg'),
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
                          SizedBox(
                            height: Get.height * 0.6,
                            child: Form(
                              key: Validation.addvisitor,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextFormField(
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintStyle: const TextStyle(
                                            color: Colors.black54),
                                        hintText: 'Enter name',
                                        contentPadding: EdgeInsets.zero,
                                        prefixIcon: const Icon(Icons.person),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'Name required'),
                                      PatternValidator(
                                          RegExp(r'^[a-z A-Z]+$').pattern,
                                          errorText: 'Invalid name')
                                    ]),
                                    onChanged: (value) =>
                                        controller.name = value,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    maxLength: 10,
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    decoration: InputDecoration(
                                        counterText: '',
                                        filled: true,
                                        hintStyle: const TextStyle(
                                            color: Colors.black54),
                                        hintText: 'Enter Phone Number ',
                                        contentPadding: EdgeInsets.zero,
                                        prefixIcon: const Icon(Icons.phone),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'Phone number required'),
                                      PatternValidator(
                                          RegExp(r'^[0-9]{10}$').pattern,
                                          errorText: 'Invalid number')
                                    ]),
                                    onChanged: (value) =>
                                        controller.phone = value,
                                  ),
                                  TextFormField(
                                    style:
                                        const TextStyle(color: Colors.black54),
                                    decoration: InputDecoration(
                                        filled: true,
                                        hintStyle: const TextStyle(
                                            color: Colors.black54),
                                        hintText: 'Enter Address',
                                        contentPadding: EdgeInsets.zero,
                                        prefixIcon: const Icon(
                                            Icons.calendar_view_day_outlined),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    validator: MultiValidator([
                                      RequiredValidator(
                                          errorText: 'Address required'),
                                    ]),
                                    onChanged: (value) =>
                                        controller.address = value,
                                  ),
                                  DropdownButtonFormField2(
                                    itemPadding: EdgeInsets.zero,
                                    decoration: InputDecoration(
                                      filled: true,
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    isExpanded: true,
                                    hint: const Text(
                                      'Purpose',
                                    ),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 45,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: controller.purposeList
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.all(10),
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.black54),
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Purpose required';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.purpose = value!;
                                      //Do something when changing the item if you want.
                                    },
                                  ),
                                  DropdownSearch(
                                    items: controller.getSenderInfo
                                        .map(
                                          (e) => e['name'],
                                        )
                                        .toList(),
                                    onChanged: (value) {
                                      controller.tomeet = value;
                                      controller.tempSender = value;
                                    },
                                    dropdownDecoratorProps:
                                        const DropDownDecoratorProps(
                                      dropdownSearchDecoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54),
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 0),
                                          hintText: "To Meet",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)))),
                                    ),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'To Meet required';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          CustomButton(
                            title: "Submit",
                            onPress: () {
                              if (Validation.addvisitor.currentState!
                                  .validate()) {
                                controller.getSenderToken();
                                controller.generateSS().then((value) {
                                  controller.saveVisitor(
                                    context,
                                  );
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ));
  }
}
