
import 'package:get/get.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/login/binding/login_binding.dart';
import 'package:visitantapp/features/login/view/login_view.dart';

List<GetPage> allpages = [

  GetPage(
      name: Routes.login,
      page: ()=>LoginView(),
     binding: LoginBinding(),
  )
];