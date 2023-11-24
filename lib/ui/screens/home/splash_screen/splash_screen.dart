import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/ui/screens/home/home_screen.dart';

import '../../../../providers/settings_provider.dart';
import '../../../utils/app_assets.dart';


class SplashScreen extends StatelessWidget {
  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
    SettingsProvider provider = Provider.of(context);
    return Scaffold(
      body: Image.asset(provider.isDark() ?
      AppAssets.splashDark
      : AppAssets.splash,fit: BoxFit.fill),
    );
  }
}
