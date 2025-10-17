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
     print("Screen height: ${Get.height}");
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
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16 ),
          child: Column(
            children: [
              Column(
                children: [Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [ CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/user.png'),
                
                
                      ),
                
                      SizedBox(height: 4,),
                      Text('John Doe', style: GoogleFonts.manrope(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: AppColor.writecolor,
                      ),)
                      
                
                
                
                
                
                      
                      ]),
                
               
          
          
                   
                    
                  
                  ],
                ),
                SizedBox(height: 20,),
          
             Row(
              children: [
                Text('Personal Information', style: GoogleFonts.manrope(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColor.writecolor,
                ),),
                
              ],




             ),
              SizedBox(height: 10,),
              buildProfileRow('Name', 'John Doe'),
              SizedBox(height: 10,),
              
          
          


          
          
          
          
          
          
          
          
          
          
          
            ],),
          
              // Center(child: ElevatedButton(onPressed:_sessionManager.logout , child: Text('logout'))),
            ],
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
         color: Colors.red,
       );


  }