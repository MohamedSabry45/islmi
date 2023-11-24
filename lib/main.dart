import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/prefs_helper/prefs_helper.dart';
import 'package:untitled/providers/settings_provider.dart';
import 'package:untitled/ui/screens/detial_screen/detials_screen.dart';
import 'package:untitled/ui/screens/home/home_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:untitled/ui/screens/home/splash_screen/splash_screen.dart';
import 'package:untitled/ui/utils/app_theme.dart';
//https://github.com/MohamedSabry45/islmi.git

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  PerfsHelper.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider()..init(),
      child: MyApp()));
}


class MyApp extends StatelessWidget {
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      themeMode: provider.currentMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: [Locale("en"),Locale("ar")],
      locale: Locale(provider.currentLocale),
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        DetailsScreen.routeName: (_) => DetailsScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
