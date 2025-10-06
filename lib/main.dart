import 'package:flutter/material.dart';
import 'package:getwell_final/Routes/routes.dart';
import '/Routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:getwell_final/Routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
Future<void> main() async {
  await dotenv.load(fileName: ".env");
   await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,      // Use the URL from .env
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!, // Use the key from .env
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
     getPages: Routes.pages,
     initialRoute: AppRoutes.questionpage,
  
     
     // check of the commits
    );
  }
}

