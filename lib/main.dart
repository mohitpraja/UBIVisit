import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:get/get.dart';
=======
<<<<<<< HEAD
import 'package:get/get_navigation/src/root/get_material_app.dart';
>>>>>>> Stashed changes
import 'package:visitantapp/core/allpages.dart';
import 'package:visitantapp/core/routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
<<<<<<< Updated upstream
=======
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
=======
import 'package:get/get.dart';
import 'package:visitantapp/core/allpages.dart';
import 'package:visitantapp/core/routes.dart';
import 'firebase_options.dart';

Future<void> main() async {
>>>>>>> Stashed changes
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
<<<<<<< Updated upstream
=======
>>>>>>> 4ade13a8bfe7a582d0dc4ea6e9c228503da6db9e
>>>>>>> Stashed changes
  runApp(const MyApp());
}

//changes by mohit
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
<<<<<<< Updated upstream
      title: 'UBIVisit',
=======
<<<<<<< HEAD
>>>>>>> Stashed changes
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: Routes.otp,
      getPages: allpage,
    );
  }
}
<<<<<<< Updated upstream
=======


=======
      title: 'UBIVisit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: Routes.otp,
      getPages: allpage,
    );
  }
}
>>>>>>> 4ade13a8bfe7a582d0dc4ea6e9c228503da6db9e
>>>>>>> Stashed changes
