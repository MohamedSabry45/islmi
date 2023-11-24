import 'package:flutter/material.dart';
import 'package:untitled/models/details_screen_args.dart';
import 'package:untitled/ui/utils/app_assets.dart';
import 'package:untitled/ui/utils/app_colors.dart';
import 'package:untitled/ui/utils/app_theme.dart';
import 'package:untitled/ui/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../detial_screen/detials_screen.dart';

class QuarnTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
            child: Image.asset(AppAssets.quranTab)),
        Divider(),
        Container(
          margin:  EdgeInsets.all(6),
            child: Text(AppLocalizations.of(context)!.quarn,style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,)),
        Divider(),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemCount: Constants.suraNames.length,
            itemBuilder: (_,index){
              return TextButton(onPressed: (){
                Navigator.pushNamed(context, DetailsScreen.routeName, arguments: DetailsScreenArgs(suraOrHadethName: "سورة ${Constants.suraNames[index]}", fileName: "${index+1}.txt", isQuarn: true));

              },
                  child:Text(Constants.suraNames[index],textAlign: TextAlign.center,style:Theme.of(context).textTheme.displayMedium)
              );
            },
          ),

        )
      ],
    );
  }
}
