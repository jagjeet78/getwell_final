import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return 
    DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'My Appointments',
              style: GoogleFonts.manrope(
                fontSize: screenWidth < 600 ? 18 : 24, // responsive font
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
      
            bottom: TabBar(tabs: 
            [
              Tab(
                icon: Icon(Icons.cloud_outlined)
               
              ),
              Tab(
                icon: Icon(Icons.ac_unit),
              )
            ]),
          ),
          body: TabBarView(children: [





            // container for the upcoming appointments 
            Container(
              color: Colors.red,
      
            ),





            // container fot the upcoming appointments
            
            Container(
              color: Colors.blue,
      
            )
          ]),
          
        ),
      ),
    );
  }
}
