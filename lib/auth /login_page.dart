import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwell_final/auth%20/otp_page.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '/services/signinotp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Authservices _authservices = Authservices();
  final TextEditingController _phonenumber = TextEditingController();
  final _formKey1 = GlobalKey<FormState>();

  bool pressed=false;
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
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 40, right: 20),
                  child: Form(
                    key: _formKey1,

                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.8,
                          
                          child: InternationalPhoneNumberInput(
                            keyboardType:TextInputType.number,
                            onInputChanged: (PhoneNumber number) {
                              print(number.phoneNumber);

                            },
                            textFieldController: _phonenumber,
                            countries: ['IN'],
                            validator: (PhoneNumber) {
                              if (PhoneNumber == null || PhoneNumber.isEmpty) {
                                return "Enter your Phone Number";
                              }

                               else if(!RegExp(r'^[0-9]{10}$').hasMatch(PhoneNumber.replaceAll(RegExp(r'\D'), ''))){
                                return "Enter a valid 10-digit number";
                              } else
                                null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 50),
                // code for the button part
                SizedBox(
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.3,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.blue,
                    ),

                    onPressed: ()async {




                      if(_formKey1.currentState!.validate()){
                  
                      setState(() {
                        
                        pressed=true;
                      });




    // 1. Create a variable for the full phone number
    // I've corrected ${_phonenumber}.text to ${_phonenumber.text}
    String fullPhoneNumber = "+91${_phonenumber.text}";

    // 2. Call your sign-in service with the number
     final value =await _authservices.signinwithotp(fullPhoneNumber);

if(value){
    Get.toNamed('/otp', arguments: fullPhoneNumber);}
    else{
      Get.snackbar("otp not sent", 'our system having the problems please try after some time');
    }
  }




                    
               
                      
             

  
                      
                  
                    },
                    child: pressed? CircularProgressIndicator():Text('login'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
