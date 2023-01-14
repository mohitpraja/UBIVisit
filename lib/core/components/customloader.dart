import 'package:flutter/material.dart';
import 'package:visitantapp/core/global/global.dart';

class CustomLoader{
  static void showLoader(BuildContext context){
    showDialog(context: context, builder: (_) => Center(child: CircularProgressIndicator(
      color: Colors.white,
      backgroundColor:GlobalColor.customColor,
    )),);
  }
}