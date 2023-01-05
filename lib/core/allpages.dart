<<<<<<< Updated upstream
import 'package:get/get.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/otp/binding/otp_binding.dart';
import 'package:visitantapp/features/otp/view/otp_view.dart';

=======
<<<<<<< HEAD
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:visitantapp/features/splash/binding/splash_binding.dart';
import 'package:visitantapp/features/splash/view/splash_view.dart';

import 'routes.dart';

List<GetPage> allpage = [
GetPage(
name: Routes.splash,
page: () => const SplashView(),
binding: SplashBinding()
),
=======
import 'package:get/get.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/otp/binding/otp_binding.dart';
import 'package:visitantapp/features/otp/view/otp_view.dart';

>>>>>>> Stashed changes
List<GetPage> allpage=[
  GetPage(
    name: Routes.otp,
    page: () => const OtpView(),
    binding: OtpBinding()
  ),
<<<<<<< Updated upstream
=======
>>>>>>> 4ade13a8bfe7a582d0dc4ea6e9c228503da6db9e
>>>>>>> Stashed changes
];