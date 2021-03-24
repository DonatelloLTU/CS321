import 'package:blackjack_ui/card.dart';
import 'package:blackjack_ui/cardtemp.dart';
import 'package:blackjack_ui/suits.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
            // padding: const EdgeInsets.all(8.0),
            //   height: 500.0,
            //   width: 500.0,

            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTemp(
                  color: Colors.red,
                  number: '10',
                  suit: clubs(),
                ),
                CardTemp(
                  color: Colors.red,
                  number: '10',
                  suit: clubs(),
                ),
              ],
            ),
            MyCard(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTemp(
                  color: Colors.red,
                  number: '10',
                  suit: clubs(),
                ),
                CardTemp(
                  color: Colors.red,
                  number: '10',
                  suit: clubs(),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
