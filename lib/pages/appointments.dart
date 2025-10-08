import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: Column(
          children: [
          Center(child: Text("i am appointments page needed to be designed ")),
          ],
        ),
      ),
    );
  }
}