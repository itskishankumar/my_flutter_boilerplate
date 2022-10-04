import 'package:shared_preferences/shared_preferences.dart';

import '../constants/keys.dart';

abstract class SharedPrefsService {
  static Future<String?> getEmailIdForSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsKey.emailIdForSignIn);
  }

  static void setEmailIdForSignIn(String emailId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(SharedPrefsKey.emailIdForSignIn, emailId);
  }
}
