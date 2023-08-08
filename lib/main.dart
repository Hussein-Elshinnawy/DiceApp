import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dicee')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNum = 1;
  int rightDiceNum = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: DiceImage(assetName: 'images/dice$leftDiceNum.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                changeDiceFace();
              },
              child: DiceImage(assetName: 'images/dice$rightDiceNum.png'),
            ),
          ),
        ],
      ),
    );
  }
  void changeDiceFace(){
    setState(() {
      leftDiceNum = Random().nextInt(6)+1;
      rightDiceNum= Random().nextInt(6)+1;
    });
  }
}

class DiceImage extends StatelessWidget {
  final String assetName;

  const DiceImage({required this.assetName});

  @override
  Widget build(BuildContext context) {
    return Image.asset(assetName);
  }
}

