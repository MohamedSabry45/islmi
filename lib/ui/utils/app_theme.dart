import 'package:flutter/material.dart';
import 'package:untitled/ui/utils/app_colors.dart';

abstract class AppTheme{
  static const TextStyle appBarTitleTextStyle = TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: AppColors.accent);
  static const TextStyle quarnTitleTextStyle = TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: AppColors.accent);
  static const TextStyle settingTabTitle = TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: AppColors.accent);
  static const TextStyle settingtext = TextStyle(fontSize: 18,fontWeight: FontWeight.normal,color: AppColors.accent);
  static const TextStyle textQuarn = TextStyle(fontSize: 24,fontWeight: FontWeight.normal,color: AppColors.accent);

  static  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor:  AppColors.transparent,
    primaryColor: AppColors.primary,
    dividerTheme: DividerThemeData(
      thickness: 3,
      color: AppColors.primary,
    ),
    appBarTheme:AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.transparent,
      centerTitle: true,
      titleTextStyle: appBarTitleTextStyle
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      selectedIconTheme: IconThemeData(size: 36),
      unselectedIconTheme: IconThemeData(size: 26),
    ),
    textTheme: TextTheme(
      bodySmall: settingtext,
      bodyMedium: settingTabTitle,
        displayMedium: quarnTitleTextStyle,
      displaySmall: textQuarn

    )


  );
  static  ThemeData darkTheme =  ThemeData(
      scaffoldBackgroundColor:  AppColors.transparent,
      primaryColor: AppColors.primaryDark,
      dividerTheme: DividerThemeData(
        thickness: 3,
        color: AppColors.accentDark,
      ),
      appBarTheme:AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.transparent,
          centerTitle: true,
          titleTextStyle: appBarTitleTextStyle.copyWith(color: AppColors.white)
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.accentDark,
        selectedIconTheme: IconThemeData(size: 36),
        unselectedIconTheme: IconThemeData(size: 26),
      ),
      textTheme: TextTheme(
        bodySmall: settingtext.copyWith(color: AppColors.white),
        bodyMedium: settingTabTitle.copyWith(color: AppColors.white),
        displayMedium: quarnTitleTextStyle.copyWith(color: AppColors.white),
        displaySmall: textQuarn.copyWith(color: AppColors.accentDark)

      )
  );

}