import 'package:get/get.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/accept&decline/binding/accept_decline_binding.dart';
import 'package:ubivisit/features/accept&decline/view/accept_decline_view.dart';
import 'package:ubivisit/features/addvisitor/binding/addvisitor_binding.dart';
import 'package:ubivisit/features/addvisitor/view/addvisitor_view.dart';
import 'package:ubivisit/features/admindash/binding/admindash_binding.dart';
import 'package:ubivisit/features/admindash/admin/adminvisitorlist/binding/adminvisitorlist_binding.dart';
import 'package:ubivisit/features/admindash/admin/adminvisitorlist/view/adminvisitorlist_view.dart';
import 'package:ubivisit/features/admindash/view/admindash_view.dart';
import 'package:ubivisit/features/forgot/binding/forgot_binding.dart';
import 'package:ubivisit/features/forgot/view/forgot_view.dart';
import 'package:ubivisit/features/googlesignup/binding/googlesignup_binding.dart';
import 'package:ubivisit/features/googlesignup/view/googlesignup_view.dart';
import 'package:ubivisit/features/intoduction/binding/introduction_binding.dart';
import 'package:ubivisit/features/intoduction/view/introduction_view.dart';
import 'package:ubivisit/features/login/binding/login_binding.dart';
import 'package:ubivisit/features/login/view/login_view.dart';
import 'package:ubivisit/features/otp/binding/otp_binding.dart';
import 'package:ubivisit/features/otp/view/otp_view.dart';
import 'package:ubivisit/features/securityguard/binding/security_guard_binding.dart';
import 'package:ubivisit/features/securityguard/view/security_guard_view.dart';
import 'package:ubivisit/features/signup/binding/signup_binding.dart';
import 'package:ubivisit/features/signup/view/signup_view.dart';
import 'package:ubivisit/features/splash/binding/splash_binding.dart';
import 'package:ubivisit/features/splash/view/splash_view.dart';
import 'package:ubivisit/features/visitoranalysis/binding/visitoranalysis_binding.dart';
import 'package:ubivisit/features/visitoranalysis/view/visitoranalysis_view.dart';
import 'package:ubivisit/features/welcome/binding/welcome_binding.dart';
import 'package:ubivisit/features/welcome/view/welcome_view.dart';

List<GetPage> allpage = [
  GetPage(
    name: Routes.otp, 
    page: () => const OtpView(), 
    binding: OtpBinding()),
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
  GetPage(
    name: Routes.acceptdecline,
    page: () => const AcceptDeclineView(),
    binding: AcceptDeclineBinding(),
  ),
  GetPage(
    name: Routes.security,
    page: () => const SecurityGuardView(),
    binding: SecurityGuardBinding(),
  ),
  GetPage(
    name: Routes.visitoranalysis,
    page: () => const VisitorAnalysisView(),
    binding: VisitorAnalysisBinding(),
  ),
  GetPage(
    name: Routes.googlesignup,
    page: () => const GoogleSignupView(),
    binding: GoogleSignupBinding(),
  ),
];
