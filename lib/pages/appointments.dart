import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_go/componets/button.dart';
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
              child: TabBar(

                tabAlignment: TabAlignment.start,
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
          body: TabBarView(
  children: [
    // Upcoming tab
    Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          upcomingAppointmentCard('Upcoming', 'Dr. John Doe', 'City Hospital', 'Cardiology', '12 Aug, 2024', '10:00AM'),
          const SizedBox(height: 16),

        ],
      ),
    ),

    // Past tab
    Container(color: Colors.white),
  ],
),


          // body: TabBarView(
          //   children: [
          //     // container for the upcoming appointments
          //     Container(
          //       color: Colors.white,
          //       child: Column(children: [


          //       ListView(
          //         shrinkWrap: true,
          //         children: [
          //           upcomingAppointmentCard(),
          //           SizedBox(height: 16),
          //           upcomingAppointmentCard(),
          //           SizedBox(height: 16),
          //           upcomingAppointmentCard(),
          //         ],
          //       ),

                

          //       ],
          //     ),
          //     ),

          //     // container fot the upcoming appointments
          //     Container(color: Colors.white),
          //   ],
          // ),
        ),
      ),
    );
  }
}

Widget upcomingAppointmentCard(String state, String doctorName , String HosptialName, String category , String date, String time ) {
  return Container(
    height: 192,
    width: 368,

    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.white,
      elevation: 0,
      child: Container(
                        height: 192,
                        width: 358,

                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.2,
                              ), // shadow color + transparency
                              blurRadius:
                                  12, // how soft or blurry the shadow looks
                              spreadRadius:
                                  -2, // how much the shadow spreads outward
                              offset: Offset(
                                0,
                                4,
                              ), // where the shadow falls (x, y)
                            ),
                          ],
                        ),

                        child: Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsetsGeometry.all(16),

                                  child: Container(
                                    height: 150,
                                    width: 320,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      height: 23,
                                                      width: 207,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [

                                                              Icon(
                                                                Icons
                                                                    .circle_rounded,
                                                                size: 8,
                                                                color:Colors.green
                                                          
                                                              ),
                                                              Text(
                                                                 ' ${state}',
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.manrope(
                                                                  fontSize: 10,
                                                                  color: AppColor
                                                                      .lightcolor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),

                                                    Container(
                                                      height: 23,
                                                      width: 207,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                '${doctorName}',
                                                                style: GoogleFonts.manrope(
                                                                  fontSize: 16,
                                                                  color: AppColor
                                                                      .writecolor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                                
                                                    
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 21,
                                                      width: 207,

                                                      child: Text(
                                                       '${HosptialName}',
                                                      ),
                                                    ),
                                                    SizedBox(height: 1),

                                          Container(
                                                      height: 21,
                                                      width: 207,

                                                      child: Text(
                                                       '${category} .${date}',
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),



























                                                    Container(
                                                      height: 44,
                                                      width: 207,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,

                                                            children: [
                                                              Button(
                                                                height: 32,
                                                                width: 84,
                                                                text: '${time}',
                                                                fontsize: 12,
                                                                backcolor: AppColor
                                                                    .backcolor,
                                                                writecolor: AppColor
                                                                    .writecolor,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),

                                            SizedBox(width: 1),
                                            Column(
                                              children: [
                                                Container(
                                                  height: 124,
                                                  width: 107,
                                                  child: Container(
                                                    height: 124,
                                                    width: 107,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12,
                                                          ), // Rounded corners
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/hos.jpg',
                                                        ),
                                                        fit: BoxFit
                                                            .cover, // Make image cover the container
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
    ),
                                
                              ],
                            ),
                          ],
                        ),
                      ),
    ),    
  );
} 