import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:getwell_final/Routes/app_routes.dart';
import 'package:getwell_final/auth%20/otp_page_controller.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '/services/signinotp.dart'; // Make sure this import path is correct

class OtpPage extends StatefulWidget {
  final String PhoneNumber;


  const OtpPage({super.key, required this.PhoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

// All of the logic below needs to be INSIDE this class
class _OtpPageState extends State<OtpPage> {
  // --- All your variables and methods go here ---
  final Authservices _authservices = Authservices();

  final OtpPageController _otpPageController = Get.put(OtpPageController());

  String _otpValue = ""; 
  // Initialized to an empty string to prevent errors

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
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Please fill the verification code sent to ${widget.PhoneNumber}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),



          Obx(
            (){
            if(_otpPageController.seconds.value!=0){
              return Padding(
              padding: const EdgeInsets.all(3),
              child: Text(
                "your otp expires in the 00:${_otpPageController.seconds.value} seconds",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              );
            }
            else if(_otpPageController.resetotpcount<3){

              return TextButton(onPressed: 
              (){
               
                _otpPageController.restartTimer();
                _authservices.signinwithotp(widget.PhoneNumber);
                
                
              }, child: Text('Resend Otp'),);



            }
            else{
              WidgetsBinding.instance.addPostFrameCallback((_) {
_otpPageController.popout(5);
});


              return Padding(padding: EdgeInsets.all(4),
              child: Text("PLease Try again Later",
              textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,
                color: Colors.red,
                ),
                
              ));
              

            }}
            
          ),
SizedBox(height: screenHeight * 0.1),
          OtpTextField(
            numberOfFields: 6,
            fieldWidth: 50,
            keyboardType: TextInputType.number,
            borderColor: Colors.blue,
            showFieldAsBox: true,
            onSubmit: (String verificationCode) {
              _otpValue = verificationCode; // save OTP
            },
          ),
          SizedBox(height: screenHeight * 0.1),
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
              onPressed: () async {
                if (_otpValue.length == 6) {
                  final otpcheck = await _authservices.verifyotp(
                    widget.PhoneNumber,
                    _otpValue,
                  );

                  if (otpcheck) {
               Get.toNamed(AppRoutes.questionpage);
                  } else {
                    Get.snackbar(
                      "Incorrect OTP",
                      "The code you entered is wrong. Please try again.",
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                } else {
                  Get.snackbar(
                    "Incomplete OTP",
                    "Please fill all 4 digits of the OTP.",
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                  );
                }
              },
              child: const Text('Verify'),
            ),
          ),
        ],
      ),
    );
  }
}
