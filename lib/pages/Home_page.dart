import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_go/themes/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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

              // this is the bottom list view and al thigns
              Padding(
                padding: EdgeInsetsGeometry.all(4),
                child: Row(children: [Container(height: 20,
                width: 20, color: Colors.amberAccent)])),
            ],
          ),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: HomePage()));
