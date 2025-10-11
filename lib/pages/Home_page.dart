import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:getwell_go/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
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
                                Icons.face,
                                size: 20,
                                color: AppColor.writecolor,
                              ),
                            ),
                            SizedBox(width: 2),
                            Text(
                              "Dermatology",
                              style: GoogleFonts.manrope(
                                color: AppColor.writecolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                      'Featured Doctors',
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
                  child: ListView(
                    children: [
                      Container(
                        height: 162,
                        width: 358,

                        decoration: BoxDecoration(
                          color: Color(0XFFFFFFFF),
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                0.1,
                              ), // shadow color + transparency
                              blurRadius:
                                  4, // how soft or blurry the shadow looks
                              spreadRadius:
                                  2, // how much the shadow spreads outward
                              offset: Offset(
                                0,
                                10,
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
                                      border: Border.all(
                                        color: Colors.redAccent, // border color
                                        width: 2, // border thickness
                                      ),
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
                                                      color: Colors.red,
                                                    ),

                                                    Container(
                                                      height: 20,
                                                      width: 207,
                                                      color: Colors.blue,

                                                    ),
                                                    Container(
                                                      height: 21,
                                                      width: 207,
                                                      color: Colors.blue,

                                                    ),
                                                    SizedBox(height: 16,),
                                                    Row(
                                                      children: [
                                                        ElevatedButton(onPressed: (){
                                                          
                                                        }, child:Text('booknow')),
                                                      ]
                                                    ),
                                                    
                                                  ],
                                                )
                                              ],
                                            ),

                                 SizedBox(width: 1,),
                                            Column(

                                              children: [
                                              Container(
                                                height: 124,
                                                width: 107,
                                                color: Colors.amberAccent,

                                                
                                              )
                                              ],


                                            ),


                                          





















                                          ],
                                        )
                                      ],
                              
                           

                                      
                                    ),
                                  ),
                                
                            )]
                             
                            ),
                          ],
                        ),
                      ),
                    ],
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

void main() => runApp(const MaterialApp(home: HomePage()));
