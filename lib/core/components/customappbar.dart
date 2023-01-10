import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customeappbar extends GetView with PreferredSizeWidget{
  final String title;
  const Customeappbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(55);


}