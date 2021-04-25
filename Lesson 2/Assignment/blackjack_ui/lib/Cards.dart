import 'package:flutter/cupertino.dart';

import 'Suit.dart';
import 'Value.dart';

///Card class is class with value and the suit of the card.
///@author Donatas Vasauskas
///@version 2021-01-28
class Cards {
  Suit suit;
  Value value;
  String name;
  bool visible;
  Image image;

  ///Constructor for the Card class
  ///@param suit is enum of the card suit
  ///@param value is enum of the card value
  Cards(
    Suit suit,
    Value value,
  ) {
    this.suit = suit;
    this.value = value;
  }

  ///toString method to get card value and suit rather than instance of the 'Card'
  ///@return value and suit of the card
  toString() {
    return '$value of $suit';
  }

  ///getValue method to get literal number value for the specific card
  ///@return value of the crds.
  int getValue() {
    if (value.index > 9) {
      return 10;
    } else if (value.index == 0) {
      return 11;
    } else {
      return value.index + 1;
    }
  }
}
