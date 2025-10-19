import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:getwell_go/Routes/app_routes.dart';
import 'package:getwell_go/pages/bottom_navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Routes/routes.dart';
import 'auth /login_page.dart';
import 'pages/Home_page.dart';
import 'services/sessionmanager.dart';
import '/Routes/app_routes.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!, // Use the URL from .env
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!, // Use the key from .env
  );
  final sessionManager = Get.put(SessionManager());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final  SessionManager _sessionManager =SessionManager();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final sessionManager = Get.find<SessionManager>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.pages,
  
     initialRoute: AppRoutes.DoctordetailsPage,
      // home: Obx(() {
      //   if (sessionManager.isLoggedIn) {
      //     return BottomNavExample(); // your main page after login
      //   } else {
      //     return LoginPage(); // your login page
      //   }
      // }),

      // check of the commits
    );
  }
}
