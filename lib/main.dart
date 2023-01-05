import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:visitantapp/core/allpages.dart';
import 'core/routes.dart';
import 'package:get/get.dart';
import 'package:visitantapp/core/allpages.dart';
import 'package:visitantapp/core/routes.dart';
import 'firebase_options.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//changes by mohit
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "UBIVisit",
      initialRoute: Routes.splash,
      getPages: allpage,
    );
  } 
}



