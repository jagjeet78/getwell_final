import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_go/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;

    return DefaultTabController(
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
                color: AppColor.writecolor,
              ),
            ),

            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,

            bottom: PreferredSize(
  preferredSize: Size.fromHeight(Get.height * 0.075),
  child: Align(
    alignment: Alignment.centerLeft, // This will now work
    child: TabBar(
      isScrollable: true,
      labelStyle: GoogleFonts.manrope(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      labelColor: Colors.black,
   
      unselectedLabelColor: const Color(0xFF61758A), 
      unselectedLabelStyle: GoogleFonts.manrope(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      indicatorColor: const Color(0xFFDBE0E5),
      indicatorWeight: 5.0,
      indicatorSize: TabBarIndicatorSize.label, 

      
      tabs: const [
        Tab(text: 'Upcoming'),
        Tab(text: 'Past'),
      ],
    ),
  ),
),
          ),

          body: TabBarView(
            children: [
              // container for the upcoming appointments
              Container(
                color: Colors.white,
                child: Column(children: [

                ],
              ),
              ),

              // container fot the upcoming appointments
              Container(color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
