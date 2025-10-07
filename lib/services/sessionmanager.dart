import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'secure_storage.dart';
import '/Routes/app_routes.dart';
class SessionManager extends GetxController {
  Rx<User?> currentUser = Rx<User?>(null);
  final SupabaseClient _supabase = Supabase.instance.client;
  final SecureStorageService storage = SecureStorageService();
  static const _sessionKey = 'supabase_session';

  @override
  void onInit() {
    super.onInit();
    _loadSession();

    _supabase.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      currentUser.value = session?.user;

      if (session != null) {
        await storage.write(_sessionKey, session.accessToken);
      } else {
        await storage.delete(_sessionKey);
      }
    });
  }

  Future<void> _loadSession() async {
    final token = await storage.read(_sessionKey);
    if (token != null) {
      currentUser.value = _supabase.auth.currentUser;
    }
  }

  Future<void> logout() async {
    await _supabase.auth.signOut();
    currentUser.value = null;
    await storage.clearAll();
    Get.offAllNamed(AppRoutes.login);
  }

  bool get isLoggedIn => currentUser.value != null;
}
