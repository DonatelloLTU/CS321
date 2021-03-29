///
///@author: Donatas Vasauskas
///@version: 2021-3-29.01
///Reference: https://medium.com/flutter-community/creating-solitaire-in-flutter-946c34ef053c

enum CardSuit {
  spades,
  hearts,
  diamonds,
  clubs,
}

enum CardType {
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king
}

/// Simple playing card model
class PlayingCard {
  CardSuit cardSuit;
  CardType cardType;
  bool faceUp;
  bool opened;

  PlayingCard({
    this.cardSuit,
    this.cardType,
    this.faceUp = false,
    this.opened = false,
  });

  int getValue() {
    return cardType.index + 1;
  }
}
