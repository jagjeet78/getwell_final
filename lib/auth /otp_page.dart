import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/route_manager.dart';
class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
       final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return  Scaffold(


       
 body: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(" PLease Fill the Verfication Code Sent at +91 78142-39065", style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      
    ),),
  
SizedBox(height: screenHeight*0.1,),
    OtpTextField(
      numberOfFields: 6,
    
    ),
    SizedBox(height: screenHeight*0.1,),
   SizedBox(
      height: screenHeight*0.05,
      width: screenWidth*0.3,
   child:  ElevatedButton(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
      ),
            backgroundColor: Colors.blue

    ),
    
    
    
    onPressed: (){
      print('the verfication button is pressed');
       

     Get.toNamed('/home');

   }, child: const Text('Verify')),

    )

  ],
 ),


    );
  }
}