import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/components/customappbar.dart';
import 'package:ubivisit/core/components/customlisttile.dart';
import 'package:ubivisit/core/fbase/firebase.dart';
import 'package:ubivisit/core/global/customfont.dart';
import 'package:ubivisit/features/showprofile/controller/showprofile_controller.dart';

class ShowProfileView extends GetView<ShowProfileController> {
  const ShowProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.loader.value
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: Customeappbar(
              title: 'Profile',
              onPress: () => Get.back(),
            ),
            body: Container(
              margin: EdgeInsets.fromLTRB(10, Get.height * 0.05, 10, 0),
              child: SizedBox(
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75),
                            child: CachedNetworkImage(
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                              imageUrl: '',
                              errorWidget: (context, url, error) =>
                                  CircleAvatar(
                                backgroundColor: Colors.indigo.shade100,
                                backgroundImage: const AssetImage(
                                    'assets/images/person.png'),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ),
                              ],
                            ),
                            CustomListTile(
                              text: FBase.userInfo['name'],
                              leading: const Icon(Icons.person),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Post',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ),
                              ],
                            ),
                            CustomListTile(
                              text: FBase.userInfo['post'],
                              leading: const Icon(Icons.card_travel),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Organization',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ),
                              ],
                            ),
                            CustomListTile(
                              text: FBase.userInfo['organization'],
                              leading: const Icon(Icons.location_city_rounded),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ),
                              ],
                            ),
                            CustomListTile(
                              text: FBase.userInfo['email'],
                              leading: const Icon(Icons.email),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Phone',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: CustomFonts.alata),
                                  ),
                                ),
                              ],
                            ),
                            CustomListTile(
                              text: FBase.userInfo['phone'],
                              leading: const Icon(Icons.phone),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text('Joined on : ${FBase.userInfo['date']}'),
                    const SizedBox(
                      height: 5,
                    )
                  ],
                ),
              ),
            ),
          ));
  }
}
