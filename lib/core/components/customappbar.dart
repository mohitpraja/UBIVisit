import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubivisit/core/global/global.dart';

class Customeappbar extends GetView with PreferredSizeWidget {
  final String title;
  final VoidCallback? onPress;
  final Color? color;
  final Color? colors;
  final TextStyle? style;

  const Customeappbar(
      {super.key,
      this.title = "",
      this.onPress,
      this.color,
      this.colors,
      this.style});
  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: color ?? GlobalColor.customColor,
      elevation: 0,
      title:
          Text(title, style: style ?? TextStyle(color: colors ?? Colors.white)),
      // titleSpacing: 1,
      // leading: IconButton(
      //   onPressed: onPress,
      //   color: colors ?? Colors.white,
      //   icon: const Icon(Icons.arrow_back),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
