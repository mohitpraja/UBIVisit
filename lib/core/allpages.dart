import 'package:get/get.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/intoduction/binding/introduction_binding.dart';
import 'package:visitantapp/features/intoduction/view/introduction_view.dart';
import 'package:visitantapp/features/login/binding/login_binding.dart';
import 'package:visitantapp/features/login/view/login_view.dart';
import 'package:visitantapp/features/otp/binding/otp_binding.dart';
import 'package:visitantapp/features/otp/view/otp_view.dart';

List<GetPage> allpage=[
  GetPage(
    name: Routes.otp,
    page: () => const OtpView(),
    binding: OtpBinding()
  ),
  GetPage(
    name: Routes.introduction,
    page: () => IntroductionView(),
    binding: IntroductionBinding()
  ),

  GetPage(name: Routes.login,
      page:() =>LoginView(),
    binding: LoginBinding()
  )
];