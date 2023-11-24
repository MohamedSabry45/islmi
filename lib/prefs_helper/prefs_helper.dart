import 'package:shared_preferences/shared_preferences.dart';

class PerfsHelper {
  static late SharedPreferences prefs;

  static String? getlanguage() {
    return prefs.getString("lang");
  }

  static setlanguage(String lang) async{
    await prefs.setString("lang", lang);
  }


  static String getMode() {
    return prefs.getString("mode")?? "light";
  }

  static setMode(String mode) async{
    await prefs.setString("mode", mode);
  }



}