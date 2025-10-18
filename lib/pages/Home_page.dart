import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getwell_go/Routes/app_routes.dart';
import 'package:getwell_go/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';
import '/componets/button.dart';
import '../sampledata/Medicalcategory.dart';
import '../sampledata/hospitaldata.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.location_on, color: Colors.amber),
                  Text(
                    "Hi User",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.notifications),
                ],
              ),

              const SizedBox(height: 20),

              // 👇 Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search best doctors near me',
                    prefixIcon: Icon(Icons.search, color: Colors.grey[700]),

                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: 12),
                    child: Text(
                      "Common Specialties",
                      style: GoogleFonts.manrope(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              Padding(
                padding: EdgeInsetsGeometry.only(left: 0),
                child: SizedBox(
                  height: 45, // must give height when inside Column
                  child: ListView.builder(
                    itemCount: medicalCategories.length,

                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final category = medicalCategories[index];
                      return Container(
                        width: 130,
                        height: 32,
                        color: Color(0xFFF0F2F5),

                        margin: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 5,
                                right: 5,
                              ),
                              child: Icon(
                                category.icon,
                                size: 18,
                                color: AppColor.writecolor,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              category.name,
                              style: GoogleFonts.manrope(
                                color: AppColor.writecolor,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 10),

              // this is the bottom list view and al thigns
              Padding(
                padding: EdgeInsetsGeometry.all(4),
                child: Row(
                  children: [
                    Text(
                      'Featured Hospitals',
                      style: GoogleFonts.manrope(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColor.writecolor,
                      ),
                    ),
                  ],
                ),
              ),

              /// list of the hospitals to be the showning here and the all
              SizedBox(height: 10),

              Expanded(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(2),
                  child: ListView.builder(
                    itemCount: hospitalsData.length,
                    itemBuilder: (context, index) {
                      final hospital = hospitalsData[index];

                      return Container(
                        height: 162,
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
                                    height: 130,
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
                                                      height: 21,
                                                      width: 207,
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                hospital['name'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.manrope(
                                                                  fontSize: 14,
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
                                                                'Multi-Specialty',
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
                                                        hospital['address'],
                                                      ),
                                                    ),
                                                    SizedBox(height: 20),
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
                                                                text: 'View',
                                                                fontsize: 12,
                                                                backcolor: AppColor
                                                                    .backcolor,
                                                                writecolor: AppColor
                                                                    .writecolor,
                                                               tapfunc: (){
                                                                Get.toNamed(AppRoutes.HospitalModel);
                                                               },
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
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// sample data before going live class MedicalCategory {

void main() => runApp(const MaterialApp(home: HomePage()));
