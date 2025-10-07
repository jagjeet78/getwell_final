import 'package:get/get.dart';
import 'package:getwell_go/Routes/app_routes.dart';
import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

class Authservices {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // ✨ FIXED: Parameter name changed from 'PhoneNumber' to 'phoneNumber'
  Future<bool> signinwithotp(String phoneNumber) async {
    try {
      await _supabaseClient.auth.signInWithOtp(phone: phoneNumber);
      return true;
    } catch (error) {
      print("error is ${error}");
      Get.snackbar('Error', 'Failed to send OTP.');
      return false;
    }
  }

  Future<AuthResponse?> verifyOtp(String phoneNumber, String otp) async {
    try {
      final response = await _supabaseClient.auth.verifyOTP(
        phone: phoneNumber,
        token: otp,
        type: OtpType.sms,
      );
      print(
        '✅ Whole Supabase Response:\n  Session: ${response.session?.toJson()}\n  User: ${response.user?.toJson()}',
      );
      return response;
    } catch (error) {
      print("❌ Error verifying OTP: $error");
      Get.snackbar('Error', 'An error occurred during verification.');
      return null;
    }
  }

  // 👇 RESTORED: This function is now active
  Future<bool> checkUserDataExists(String userId) async {
    try {
      final response = await _supabaseClient
          .from('profiles')
          .select('onboardingcompleted')
          .eq('id', userId)
          .maybeSingle();

      if (response == null) {
        return false;
      }
      return response['onboardingcompleted'] == true;
    } catch (error) {
      print('Error checking user data: $error');
      return false;
    }
  }
}
