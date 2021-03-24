import 'Card.dart';

///Dealer class for the BlackJack game
///@author DOnatas Vasauskas
///@version 2021-01-29.01
class Dealer {
  //extends Player{ for some reason when extending it just freezes without errors.
  String name;

  List<Card> hand = List<Card>();
  int stash;

  ///Constructor for Dealer class.
  ///Default Dealers name Dealer
  ///Dealers stash for his credits
  Dealer() {
    name = "Dealer";
    stash = 5000;
  }

  ///getName method to get the name of the Dealer
  ///@return name String representation of Dealers name
  String getName() {
    return name;
  }

  ///getHand method gets Dealers hand
  void getHand() {
    for (int i = 0; i <= hand.length; i++) print(hand.elementAt(i).toString());
  }

  ///getStash method gets dealers stash
  ///@return stash is numbver of credits Dealer has
  int getStash() {
    return stash;
  }

  ///addToStash method to add funds to stash
  ///@param i is defined in the game by the bet
  // ignore: missing_return
  int addToStash(int i) {
    stash = stash + i;
  }

  ///takeOutStash method to take away funds from the stash
  ///@param i is integer representation of credits taken out.
  // ignore: missing_return
  int takeOutStash(int i) {
    stash = stash - i;
  }

  ///addCard method adds card instance to the dealers hand
  ///@param card is instance of the card
  void addCard(Card card) {
    hand.add(card);
  }

  ///clearHand method is to clear Dealers hand after each round
  void clearHand() {
    hand.clear();
  }

  ///handValue method to get full value of the hand
  ///@return count integer for the value
  int handValue() {
    int values;
    int count = 0;
    for (int i = 0; i < hand.length; i++) {
      values = hand.elementAt(i).getValue();
      if (values > 10) {
        values = 10;
      }
      count = count + values;
    }
    return count;
  }
}
