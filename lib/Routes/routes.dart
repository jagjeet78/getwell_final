import 'package:get/get.dart';
import 'package:getwell_go/pages/ai_chatbot.dart';
import 'package:getwell_go/pages/appointments.dart';
import '../auth /login_page.dart';
import 'app_routes.dart';
import '../auth /otp_page.dart';
import '../pages/Home_page.dart';
import '../pages/questions_page.dart';
import '../pages/bottom_navigation.dart';



class Routes {
  static const initialroute = AppRoutes.login;
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpPage(PhoneNumber: Get.arguments),
    ),
   
    GetPage(name: AppRoutes.questionpage, page: () => QuestionsPage()),
    GetPage(name: AppRoutes.bottomnavigation, page:()=>BottomNavExample()),
    GetPage(name: AppRoutes.AppointmentsScreen, page:()=>AppointmentsScreen()),
    GetPage(name: AppRoutes.chatbotScreen, page:()=>AiChatbotScreen()),
    GetPage(name: AppRoutes.HomeScreen, page:()=>HomePage()),

  ];
}
