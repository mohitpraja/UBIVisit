import 'package:get/get.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/addvisitor/binding/addvisitor_binding.dart';
import 'package:visitantapp/features/addvisitor/view/addvisitor_view.dart';
import 'package:visitantapp/features/admindash/binding/admindash_binding.dart';
import 'package:visitantapp/features/admindash/admin/adminvisitorlist/binding/adminvisitorlist_binding.dart';
import 'package:visitantapp/features/admindash/admin/adminvisitorlist/view/adminvisitorlist_view.dart';
import 'package:visitantapp/features/admindash/view/admindash_view.dart';
import 'package:visitantapp/features/forgot/binding/forgot_binding.dart';
import 'package:visitantapp/features/forgot/view/forgot_view.dart';
import 'package:visitantapp/features/intoduction/binding/introduction_binding.dart';
import 'package:visitantapp/features/intoduction/view/introduction_view.dart';
import 'package:visitantapp/features/login/binding/login_binding.dart';
import 'package:visitantapp/features/login/view/login_view.dart';
import 'package:visitantapp/features/otp/binding/otp_binding.dart';
import 'package:visitantapp/features/otp/view/otp_view.dart';
import 'package:visitantapp/features/signup/binding/signup_binding.dart';
import 'package:visitantapp/features/signup/view/signup_view.dart';
import 'package:visitantapp/features/splash/binding/splash_binding.dart';
import 'package:visitantapp/features/splash/view/splash_view.dart';
import 'package:visitantapp/features/welcome/view/welcome_view.dart';

import '../features/welcome/binding/welcome_binding.dart';

List<GetPage> allpage = [
  GetPage(name: Routes.otp, page: () => const OtpView(), binding: OtpBinding()),
  GetPage(
      name: Routes.introduction,
      page: () => const IntroductionView(),
      binding: IntroductionBinding()),
  GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding()),
  GetPage(
    name: Routes.forgot,
    page: () => const ForgotView(),
    binding: ForgotBinding(),
  ),
  GetPage(
    name: Routes.splash,
    page: () => const SplashView(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: Routes.admindash,
    page: () => const AdminDashView(),
    binding: AdminDashBinding(),
  ),
  GetPage(
    name: Routes.adminvisitorlist,
    page: () => const AdminVisitorListView(),
    binding: AdminVisitorListBinding(),
  ),
  GetPage(
    name: Routes.welcome,
    page: () => const WelcomeView(),
    binding: WelcomeBinding(),
  ),
  GetPage(
    name: Routes.signup,
    page: () => const SignupView(),
    binding: SignupBinding(),
  ),
  GetPage(
    name: Routes.addvisitor,
    page: () => const AddvisitorView(),
    binding: AddvisitorBinding(),
  ),
];
