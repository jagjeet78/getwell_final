import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_final/auth%20/otp_page.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth * 0.97, // ✅ use relative sizing
                  height: screenHeight * 0.5, // ✅ don’t hardcode big numbers
                  fit: BoxFit.contain,
                ),

                // here the pending task is adding the phone number input and the submit button with the animation and all
                Form(
                  child: Column(
                    children: [
                      SizedBox(
                        width: screenWidth * 0.8,
                        child: IntlPhoneField(
                          initialCountryCode: 'IN',
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: const TextStyle(color: Colors.grey),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2,
                              ), // normal border
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.green,
                                width: 2,
                              ), // when focused
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                    ],
                  ),
                ),



  const SizedBox(height: 50,),
// code for the button part 
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
    Get.toNamed('/otp');

   }, child: const Text('login')),

    )














              ],
            ),
          ),
        ],
      ),
    );
  }
}
