import 'dart:math';

import 'Card.dart';
import 'Suit.dart';
import 'Value.dart';

///Class Deck holds card instances and has methods to help with the game
///@author DOnatas Vasauskas
///@version  2021-01-29.01
class Deck {
  List<Card> deck = List<Card>();
  Random rand = new Random();

  ///Constructor for Deck class
  ///add all the cards with suit and value, plus shuffles the deck to randomize it.
  Deck() {
    for (Suit suit in Suit.values) {
      for (Value value in Value.values) {
        deck.add(new Card(suit, value));
      }
    }
    deck.shuffle();
  }

  ///toString method to get string representation of the deck
  ///@return deck to string
  toString() {
    return deck.toString();
  }

  ///printDeck method to printout each element of the deck
  void printDeck() {
    for (int i = 0; i < deck.length; i++) {
      print(deck.elementAt(i).toString());
    }
  }

  ///suffle method to shuffle the collection of cards
  void shuffle() {
    deck.shuffle();
  }

  ///draw method to get instance of the card at index 0
  ///@return instance of the card in index 0
  Card draw() {
    int i = 0;
    return deck.removeAt(0);
  }

  ///drawCard method to get instance of the card
  ///@param i integer to specify which index of the card to return
  ///@return specified indexed card
  Card drawCard(int i) {
    return deck.removeAt(i);
  }

  ///size method to get the size of the deck
  ///@return integer of the size
  int size() {
    return deck.length;
  }
}

///main method within Deck card for my own reference
void main() {
  Deck deck = new Deck();
  deck.printDeck();
}
