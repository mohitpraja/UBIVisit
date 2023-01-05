import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:visitantapp/core/routes.dart';
import '../feature/signup/signupbinding/signup_binding.dart';
import '../feature/signup/signupview/signup_view.dart';

List<GetPage> allpages = [



  GetPage(name: RoutesConstant.signup,
    page: ()=> SignupView(),
    binding: SignUpBinding(),
  ),
];