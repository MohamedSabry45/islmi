import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/home/tabs/radio_tab/Radios.dart';
import 'package:audioplayers/audioplayers.dart';


class RadioWidget extends StatelessWidget {
  final player = AudioPlayer();
  RadioWidget({required this.radiosData});
  RadiosData radiosData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              radiosData.name!,
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                IconButton(
                  onPressed: () {
                    player.play(UrlSource(radiosData.url!));
                  },
                  icon: Icon(Icons.play_arrow,),
                ),
                IconButton(
                  onPressed: () {
                    player.pause();

                  },
                  icon: Icon(Icons.pause,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
