import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../prefs_helper/prefs_helper.dart';

class SettingsProvider extends ChangeNotifier{



  String currentLocale = "en";
ThemeMode currentMode = ThemeMode.light;
bool isDark() => currentMode == ThemeMode.dark;
  bool isArab() => currentLocale == "ar";


  void init()async{
   String? newLang =  await PerfsHelper.getlanguage();
    setCurrentLocale(newLang??"en");
   String? newMode =  PerfsHelper.getMode();
    if(newMode == "dark" ){
 setCurrentMode(ThemeMode.dark);
    }else{
      setCurrentMode(ThemeMode.light);
}



  }
void setCurrentMode(ThemeMode newThemeMode){
  currentMode = newThemeMode;
 if(newThemeMode == ThemeMode.dark) {
   PerfsHelper.setMode("dark");
 }else{
   PerfsHelper.setMode("light");
 }
  notifyListeners();
}

void setCurrentLocale(String newLocale){
  currentLocale = newLocale;
  PerfsHelper.setlanguage(newLocale);
  notifyListeners();
}

}