import 'package:get/get.dart';
import 'package:visitantapp/core/routes.dart';
import 'package:visitantapp/features/otp/binding/otp_binding.dart';
import 'package:visitantapp/features/otp/view/otp_view.dart';

List<GetPage> allpage=[
  GetPage(
    name: Routes.otp,
    page: () => const OtpView(),
    binding: OtpBinding()
  ),
];