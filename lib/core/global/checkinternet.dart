import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckConnection{
  static checkInternet() async {
    final bool isConnected = await InternetConnectionChecker().hasConnection;
     isConnected==true?print('succ'):  CircularProgressIndicator();
    print(isConnected);


  }

}