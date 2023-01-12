import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GlobalFunction {
  static final formkey=GlobalKey<FormState>();
  static isValid(val,msg){
    if(val==null||val.isEmpty){
      return msg;
    }
  }
  static formValid(){
    if(formkey.currentState!.validate()){
      return true;
    }else{
      return false;
    }
  }

  static CheckConnection() async {
    // print("The statement 'this machine is connected to the Internet' is: ");
    print(await InternetConnectionChecker().hasConnection);
    // returns a bool

    // We can also get an enum value instead of a bool
    print("Current status: ${await InternetConnectionChecker().connectionStatus}");
    // prints either InternetConnectionStatus.connected
    // or InternetConnectionStatus.disconnected

    // This returns the last results from the last call
    // to either hasConnection or connectionStatus
    // print("Last results: ${InternetConnectionChecker().lastTryResults}");

    // actively listen for status updates
    // this will cause InternetConnectionChecker to check periodically
    // with the interval specified in InternetConnectionChecker().checkInterval
    // until listener.cancel() is called
    var listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          print('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          print('You are disconnected from the internet.');
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    // await Future.delayed(Duration(seconds: 30));
    // await listener.cancel();

    // var connectionResult =
    //
    //     await Connectivity().checkConnectivity();
    // print("net nkissue");
    //
    // if (connectionResult == ConnectivityResult.none) {
    //   // print("net issue");
    //   return null;
    // }
     // CustomSnackbar(title:"Alert",message:"Please check ypur Connection");
  }
  
}