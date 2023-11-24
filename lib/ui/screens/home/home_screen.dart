import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/settings_provider.dart';
import 'package:untitled/ui/screens/home/tabs/ahadeth_tab/ahadeth_tab.dart';
import 'package:untitled/ui/screens/home/tabs/quarn_tab/quarn_tab.dart';
import 'package:untitled/ui/screens/home/tabs/radio_tab/radio_tab.dart';
import 'package:untitled/ui/screens/home/tabs/sebha_tab/sebha_tab.dart';
import 'package:untitled/ui/screens/home/tabs/setting_tab/setting_tab.dart';
import 'package:untitled/ui/utils/app_assets.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
 static const String routeName = "home";


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuarnTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab()
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(provider.isDark() ?
          AppAssets.backGroundDark :
              AppAssets.backGround)
              ,fit: BoxFit.fill),
        ),
            child: Scaffold(
              backgroundColor: AppColors.transparent,
          appBar:
          AppBar(
            title:
            Text(AppLocalizations.of(context)!.islami),
          ),
       body: tabs[currentTabIndex],
       bottomNavigationBar: buildBottomNavigationBar(),
      ),
      );
  }

  Widget buildBottomNavigationBar() =>
      Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          currentIndex: currentTabIndex,
     onTap: (index){
        currentTabIndex = index;
       setState(() {});
     },
    items: [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)),label:AppLocalizations.of(context)!.quarn),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhades)),label:AppLocalizations.of(context)!.ahadeth),
        BottomNavigationBarItem(icon:ImageIcon(AssetImage(AppAssets.icSebha)) ,label: AppLocalizations.of(context)!.sebha),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: AppLocalizations.of(context)!.radio),
        BottomNavigationBarItem(icon: Icon(Icons.settings,size: 25,),label:AppLocalizations.of(context)!.setting),

    ],
  ),
      );
}
