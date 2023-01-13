import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:visitantapp/core/components/customloader.dart';

class GlobalFunction {
   static checkInternet(context,routename) async {
      CustomLoader.showLoader(context);
      if(!(await InternetConnectionChecker().hasConnection)){
        Get.back();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.warning,
          title: 'Warning!!!',
          desc: 'Check internet connection',
        ).show();
      }else{
        Get.back();
        Get.toNamed(routename);
       
      }

    }

  
}