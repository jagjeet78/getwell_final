import 'package:flutter/material.dart';
import '/services/sessionmanager.dart';
import 'package:google_fonts/google_fonts.dart';
import '/themes/app_color.dart';
import 'package:get/get.dart';
import '/themes/app_color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final SessionManager _sessionManager = SessionManager();

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
           automaticallyImplyLeading: false,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                'assets/images/user.png',
                              ),
                            ),
          
                            SizedBox(height: 4),
                            Text(
                              'John Doe',
                              style: GoogleFonts.manrope(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: AppColor.writecolor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
          
                    Row(
                      children: [
                        Text(
                          'Personal Information',
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.writecolor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    buildProfileRow('Name', 'John Doe'),
                    SizedBox(height: 20),
                          buildProfileRow('Date of Birth', 'July 15, 1985'),
                              SizedBox(height: 20),
                          buildProfileRow('Address', '123 Main Street, Anytown, USA'),
                          SizedBox(height: 20,),
                       
                  Row(
                      children: [
                        Padding(
                          padding: EdgeInsetsGeometry.only( left: 1),
                          child: Text(
                            'Contact Details',
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.writecolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
          
                         buildProfileRow('Address', '123 Main Street, Anytown, USA'),
                          SizedBox(height: 20),
          
                         buildProfileRow('Email Address', 'amelia.chen@email.com'),
                         
                         
                          SizedBox(height: 20),
                         buildProfileRow('Phone Number', '+1 234 567 8901'),

  SizedBox(height: 20),
                           Row(
                      children: [
                        Text(
                          'Medical Perferences',
                          style: GoogleFonts.manrope(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColor.writecolor,
                          ),
                        ),
                      ],
                    ),
                         SizedBox(height: 20),
                      buildProfileRow('Blood Type', 'A+'),
                          SizedBox(height: 20),
          
                         buildProfileRow('Allergies', 'None'),
                         
                         
                          SizedBox(height: 20),
                         buildProfileRow('Chronic Conditions', 'None'),
                          SizedBox(height: 20),
                          logout('Logout'),



          
          
          
                  ],
                ),
          
                // Center(child: ElevatedButton(onPressed:_sessionManager.logout , child: Text('logout'))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildProfileRow(String label, String value) {
  return Container(
    width: double.infinity,
    height: Get.height * 0.07,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width * 0.7,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    '  $label',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.writecolor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    '  $value',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: AppColor.writecolor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Container(
          width: Get.width * 0.1,
          height: Get.height * 0.05,

          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.edit, color: AppColor.writecolor, size: 24),
          ),
        ),
      ],
    ),
  );
}
Widget logout(String label,) {
  return Container(
    width: double.infinity,
    height: Get.height * 0.07,

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: Get.width * 0.7,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    '  $label',
                    style: GoogleFonts.manrope(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.writecolor,
                    ),
                  ),
                ],
              ),
            
              
            ],
          ),
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
            width: Get.width * 0.1,
            height: Get.height * 0.05,
          
            child: IconButton(
              onPressed: () {
                SessionManager().logout();
              },
              icon: Icon(Icons.logout_sharp, color: AppColor.writecolor, size: 16),
            ),
          ),]
        ),
      ],
    ),
  );
}
