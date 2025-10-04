import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
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
  String _otpValue = ""; // Initialized to an empty string to prevent errors

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
          SizedBox(height: screenHeight * 0.1),
          OtpTextField(
            numberOfFields: 6,
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
            
                   final  otpcheck=  await _authservices.verifyotp(widget.PhoneNumber, _otpValue);


                  if (otpcheck) {
                    Get.offAllNamed('/home'); // Use offAllNamed to prevent going back
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