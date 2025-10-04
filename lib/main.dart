import 'package:flutter/material.dart';
import 'package:getwell_final/Routes/routes.dart';
import '/Routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:getwell_final/Routes/app_routes.dart';
void main() {
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
     initialRoute: AppRoutes.login,
  
     
     // check of the commits
    );
  }
}

