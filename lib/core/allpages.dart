import 'package:get/get.dart';
import 'package:ubivisit/core/routes.dart';
import 'package:ubivisit/features/accept&decline/binding/accept_decline_binding.dart';
import 'package:ubivisit/features/accept&decline/view/accept_decline_view.dart';
import 'package:ubivisit/features/addemployee/binding/addemployee_binding.dart';
import 'package:ubivisit/features/addemployee/view/addemployee_view.dart';
import 'package:ubivisit/features/addguard/binding/addguard_binding.dart';
import 'package:ubivisit/features/addguard/view/addguard_view.dart';
import 'package:ubivisit/features/addvisitor/binding/addvisitor_binding.dart';
import 'package:ubivisit/features/addvisitor/view/addvisitor_view.dart';
import 'package:ubivisit/features/admindash/binding/admindash_binding.dart';
import 'package:ubivisit/features/admindash/admin/adminvisitorlist/binding/adminvisitorlist_binding.dart';
import 'package:ubivisit/features/admindash/admin/adminvisitorlist/view/adminvisitorlist_view.dart';
import 'package:ubivisit/features/admindash/view/admindash_view.dart';
import 'package:ubivisit/features/editprofile/binding/editprofile_binding.dart';
import 'package:ubivisit/features/editprofile/view/editprofile_view.dart';
import 'package:ubivisit/features/empdash/binding/empdash_binding.dart';
import 'package:ubivisit/features/empdash/view/empdash_view.dart';
import 'package:ubivisit/features/forgot/binding/forgot_binding.dart';
import 'package:ubivisit/features/forgot/view/forgot_view.dart';
import 'package:ubivisit/features/forgototp/binding/forgot_otp_binding.dart';
import 'package:ubivisit/features/forgototp/view/forgot_otp_view.dart';
import 'package:ubivisit/features/googlesignup/binding/googlesignup_binding.dart';
import 'package:ubivisit/features/googlesignup/view/googlesignup_view.dart';
import 'package:ubivisit/features/guarddash/binding/guarddash_binding.dart';
import 'package:ubivisit/features/guarddash/view/guarddash_view.dart';
import 'package:ubivisit/features/intoduction/binding/introduction_binding.dart';
import 'package:ubivisit/features/intoduction/view/introduction_view.dart';
import 'package:ubivisit/features/login/binding/login_binding.dart';
import 'package:ubivisit/features/login/view/login_view.dart';
import 'package:ubivisit/features/manageuser/binding/manageuser_binding.dart';
import 'package:ubivisit/features/manageuser/view/manageuser_view.dart';
import 'package:ubivisit/features/otp/binding/otp_binding.dart';
import 'package:ubivisit/features/otp/view/otp_view.dart';
import 'package:ubivisit/features/profileotp/binding/profileotp_binding.dart';
import 'package:ubivisit/features/profileotp/view/profileotp_view.dart';
import 'package:ubivisit/features/showprofile/binding/showprofile_binding.dart';
import 'package:ubivisit/features/showprofile/view/showprofile_view.dart';
import 'package:ubivisit/features/signup/binding/signup_binding.dart';
import 'package:ubivisit/features/signup/view/signup_view.dart';
import 'package:ubivisit/features/splash/binding/splash_binding.dart';
import 'package:ubivisit/features/splash/view/splash_view.dart';
import 'package:ubivisit/features/updatepass/binding/updatepass_binding.dart';
import 'package:ubivisit/features/updatepass/view/updatepass_view.dart';
import 'package:ubivisit/features/visitoranalysis/binding/visitoranalysis_binding.dart';
import 'package:ubivisit/features/visitoranalysis/view/visitoranalysis_view.dart';
import 'package:ubivisit/features/visitorotp/binding/visitorotp_binding.dart';
import 'package:ubivisit/features/visitorotp/view/visitorotp_view.dart';
import 'package:ubivisit/features/welcome/binding/welcome_binding.dart';
import 'package:ubivisit/features/welcome/view/welcome_view.dart';

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
  GetPage(
    name: Routes.acceptdecline,
    page: () => const AcceptDeclineView(),
    binding: AcceptDeclineBinding(),
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
 
  GetPage(
    name: Routes.addemployee,
    page: () => const AddEmployeeView(),
    binding: AddEmployeeBinding(),
  ),
  GetPage(
    name: Routes.addguard,
    page: () => const AddGuardView(),
    binding: AddGuardBinding(),
  ),
  GetPage(
    name: Routes.guarddash,
    page: () => const GuardDashView(),
    binding: GuardDashBinding(),
  ),
  GetPage(
    name: Routes.empdash,
    page: () => const EmpDashView(),
    binding: EmpDashBinding(),
  ),
  GetPage(
    name: Routes.manageuser,
    page: () => const ManageUserView(),
    binding: ManageUserBinding(),
  ),
  GetPage(
    name: Routes.visitorotp,
    page: () => const VisitorOtpView(),
    binding: VisitorOtpBinding(),
  ),
  GetPage(
    name: Routes.forgototp,
    page: () => const ForgotOtpView(),
    binding: ForgotOtpBinding(),
  ),
  GetPage(
    name: Routes.updatepass,
    page: () => const UpdatePass(),
    binding: UpdatePassBinding(),
  ),
  GetPage(
    name: Routes.showprofile,
    page: () => const ShowProfileView(),
    binding: ShowProfileBinding(),
  ),
  GetPage(
    name: Routes.editprofile,
    page: () => const EditProfileView(),
    binding: EditProfileBinding(),
  ),
  GetPage(
    name: Routes.profileotp,
    page: () => const ProfileOtpView(),
    binding: ProfileOtpBinding(),
  ),
];
