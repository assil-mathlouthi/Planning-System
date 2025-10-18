import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  // Ensure .env is loaded (idempotent)
  static Future<void> ensureLoaded() async {
    if (!dotenv.isInitialized) {
      await dotenv.load(fileName: ".env");
    }
  }

  static String? get configuredEmail => dotenv.env['EMAIL']?.trim();
  static String? get configuredPassword => dotenv.env['PASSWORD'];

  static Future<bool> validateCredentials({
    required String email,
    required String password,
  }) async {
    await ensureLoaded();
    final e = configuredEmail;
    final p = configuredPassword;
    if (e == null || p == null) return false;
    return email.trim().toLowerCase() == e.toLowerCase() && password == p;
  }
}
