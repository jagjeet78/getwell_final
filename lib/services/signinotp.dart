import 'package:supabase_flutter/supabase_flutter.dart';



class Authservices{

final SupabaseClient _supabaseClient =Supabase.instance.client;

  Future<bool > signinwithotp(String PhoneNumber) async{
    try{

      await _supabaseClient.auth.signInWithOtp(phone: PhoneNumber);
      return true;

      }catch(error){
        print("error is ${error}");
        return false;
      }


  }
  Future<bool > verifyotp( String  phonenumber ,  String  otp) async{ 
  

  try{
    
  await _supabaseClient.auth.verifyOTP(
  phone: phonenumber,
  token: otp,
  type: OtpType.sms,
  );
  return true;
 
  }
  catch(error){
  print('${error}');
  return false;

  }

  }
}
