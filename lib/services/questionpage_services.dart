import 'package:supabase_flutter/supabase_flutter.dart';


class SendData {
  final supabase = Supabase.instance.client;

  Future<void> insertUserProfile({
    required String fullName,
    required String gender,
    required int age,
  }) async {
    try {
      final user = supabase.auth.currentUser;

      if (user == null) {
        print('❌ No user logged in');
        return;
      }

      final response = await supabase.from('profiles').insert({
        'id': user.id,
        'full_name': fullName,
        'gender': gender,
        'age': age,
        'onboardingcompleted':true,
      });

      print('✅ Profile inserted successfully: $response');
    } catch (e) {
      print('❌ Error inserting profile: $e');
    }
  }
}
