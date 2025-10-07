import 'package:get/get.dart';
import '../auth /login_page.dart';
import 'app_routes.dart';
import '../auth /otp_page.dart';
import '../pages/Home_page.dart';
import '../pages/questions_page.dart';

class Routes {
  static const initialroute = AppRoutes.login;
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpPage(PhoneNumber: Get.arguments),
    ),
    GetPage(name: AppRoutes.homepage, page: () => HomePage()),
    GetPage(name: AppRoutes.questionpage, page: () => QuestionsPage()),
  ];
}
