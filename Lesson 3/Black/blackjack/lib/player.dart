///Player class for the game
///@author Donatas Vasauskas
///@version 2021-01-30
class Player {
  String name;

  ///Deck deck;
  //List<Card> hand = List<Card>();
  String stash;

  ///Constructor for Player class with user specified name and preset stash
  Player({this.name, this.stash});

  ///getName method to get the name of the Player
  ///@return name String representation of Player name
  String getName() {
    return name;
  }

  // ///getHand method gets Player hand
  // void getHand() {
  //   for (int i = 0; i <= hand.length; i++) print(hand.elementAt(i).toString());
  // }

  ///getStash method gets players stash
  ///@return stash is numbver of credits Players has
  String getStash() {
    return stash;
  }

  ///addToStash method to add funds to stash
  ///@param i is defined in the game by the bet
  // ignore: missing_return
  // int addToStash(int i) {
  //   stash = stash + i;
  // }

  ///takeOutStash method to take away funds from the stash
  ///@param i is integer representation of credits taken out.
  // ignore: missing_return
  // int takeOutStash(int i) {
  //   stash = stash - i;
  // }

  // ///addCard method adds card instance to the dealers hand
  // ///@param card is instance of the card
  // void addCard(Card card) {
  //   hand.add(card);
  // }

  // ///clearHand method is to clear Players hand after each round
  // void clearHand() {
  //   hand.clear();
  // }

//   ///handValue method to get full value of the hand
//   ///@return count integer for the value
//   int handValue() {
//     int values;
//     int count = 0;
//     for (int i = 0; i < hand.length; i++) {
//       values = hand.elementAt(i).getValue();
//       if (values > 10) {
//         values = 10;
//       }
//       count = count + values;
//     }
//     return count;
//   }
}
