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

// Simple playing card model
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
    if (cardType.index > 9) {
      return 10;
    } else if (cardType.index == 0) {
      return 11;
    } else {
      return cardType.index + 1;
    }
  }
}
