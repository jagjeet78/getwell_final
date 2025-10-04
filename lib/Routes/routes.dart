import 'package:get/get.dart';
import 'package:getwell_final/auth /login_page.dart';
import 'package:getwell_final/Routes/app_routes.dart';
import 'package:getwell_final/auth /otp_page.dart';

import 'package:getwell_final/pages/Home_page.dart';

class Routes {
  static const initialroute= AppRoutes.login;
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.otp, page: ()=>OtpPage(PhoneNumber: Get.arguments),),
    GetPage(name: AppRoutes.homepage, page: ()=>HomePage()),
  ];
}