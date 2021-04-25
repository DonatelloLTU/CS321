import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

import 'suits.dart';
import 'Value.dart';

class CardTemp extends StatelessWidget {
  Suit suit;
  Value value;

  Card(Suit suit, Value value) {
    this.suit = suit;
    this.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.all(7),
          color: Colors.white,
          height: 150,
          width: 100,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(value, style: TextStyle(fontSize: 15)),
                ],
              ),
              suit,
            ],
          )),
        ),
      ),
    );
  }
}
