import 'package:flutter/material.dart';
import '/services/sessionmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import '/themes/app_color.dart';
import 'package:get/get.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final SessionManager _sessionManager =SessionManager();
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            backgroundColor: Colors.white,

 appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Profile',
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Column(
       
          
          children: [















            
          // Center(child: ElevatedButton(onPressed:_sessionManager.logout , child: Text('logout'))),
        ],),
      ),
    );
  }
}