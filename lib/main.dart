import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  void playSound(int i) async{
    final player1 = AudioPlayer();
    await player1.play(AssetSource('note$i.wav'));
  }

  Expanded buildKey(int num) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          playSound(num);
        }, child: Container(
        decoration: BoxDecoration(
          color: colorList[num - 1],
        ),
      ),
      ),
    );
  }

  List<Color> colorList =[
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.greenAccent,
    Colors.blue,
    Colors.purple
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int i = 1; i < 8; i++) buildKey(i),
            ],
          )
        ),
      ),
    );
  }
}
