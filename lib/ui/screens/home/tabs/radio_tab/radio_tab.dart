import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/home/tabs/radio_tab/Radio_maodel.dart';
import 'package:untitled/ui/screens/home/tabs/radio_tab/Radios.dart';
import 'package:untitled/ui/screens/home/tabs/radio_tab/radio_wedgit.dart';
import 'package:http/http.dart' as http;

class RadioTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image.asset("assets/images/radio_image.png")),
          Expanded(
            child: FutureBuilder(
              builder: (context,snapshot) {
                if(snapshot.hasError){
                  return const Center(child: Text('there was an error try again later '));
                }
                else if(snapshot.connectionState==ConnectionState.waiting){
                  return Center(child:CircularProgressIndicator() );
                }
                RadioMaodel radioModel=snapshot.data!;
                List<RadiosData> radioData= radioModel.radios!;
                return ListView.builder(
                    reverse: true,
                    physics: PageScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return RadioWidget(radiosData:radioData[index] ,);
                    });
              }, future: getApiData(),
            ),
          )
        ],
      ),
    );
  }

   Future <RadioMaodel> getApiData() async {
    var uri = Uri.parse('https://mp3quran.net/api/v3/radios?language=ar');
    http.Response responce = await http.get(uri);
    var json = jsonDecode(responce.body);
   RadioMaodel model= RadioMaodel.fromJson(json);
    return model;
  }
}
