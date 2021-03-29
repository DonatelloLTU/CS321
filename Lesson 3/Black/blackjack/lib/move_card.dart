import 'package:blackjack/card_row.dart';
import 'package:blackjack/playing_card.dart';
import 'package:flutter/material.dart';

///
///TransformedCard allows for card to be draggable.
///@author: Donatas Vasauskas
///@version: 2021-3-29.01
///Reference: https://medium.com/flutter-community/creating-solitaire-in-flutter-946c34ef053c

class TransformedCard extends StatefulWidget {
  final PlayingCard playingCard;
  final double transformDistance;
  final int transformIndex;
  final int columnIndex;
  final List<PlayingCard> attachedCards;

  TransformedCard({
    @required this.playingCard,
    this.transformDistance = 15.0,
    this.transformIndex = 0,
    this.columnIndex,
    this.attachedCards,
  });

  @override
  _TransformedCardState createState() => _TransformedCardState();
}

class _TransformedCardState extends State<TransformedCard> {
  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          0.0,
          widget.transformIndex * widget.transformDistance + 5,
          0.0,
        ),
      child: _buildCard(),
    );
  }

  ///
  /// Creates card with face down
  ///
  Widget _buildCard() {
    return !widget.playingCard.faceUp
        ? Container(
            height: 100.0,
            width: 60.0,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
            ),
          )
        : Draggable<Map>(
            child: _buildFaceUpCard(),
            feedback: CardColumn(
              cards: widget.attachedCards,
              columnIndex: 1,
              // onCardsAdded: (card, position) {},
            ),
            childWhenDragging: _buildFaceUpCard(),
            data: {
              "cards": widget.attachedCards,
              "fromIndex": widget.columnIndex,
            },
          );
  }

  ///
  /// Create face up card with this method.
  ///
  Widget _buildFaceUpCard() {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          border: Border.all(color: Colors.black),
        ),
        height: 100.0,
        width: 60,
        child: Stack(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Center(
                    child: Text(
                      _cardTypeToString(),
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    child: _suitToImage(),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _cardTypeToString(),
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    Container(
                      height: 10.0,
                      child: _suitToImage(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  /// Card values
  ///
  String _cardTypeToString() {
    switch (widget.playingCard.cardType) {
      case CardType.one:
        return "A";
      case CardType.two:
        return "2";
      case CardType.three:
        return "3";
      case CardType.four:
        return "4";
      case CardType.five:
        return "5";
      case CardType.six:
        return "6";
      case CardType.seven:
        return "7";
      case CardType.eight:
        return "8";
      case CardType.nine:
        return "9";
      case CardType.ten:
        return "10";
      case CardType.jack:
        return "J";
      case CardType.queen:
        return "Q";
      case CardType.king:
        return "K";
      default:
        return "";
    }
  }

  ///
  /// Images for the card suit
  ///
  Image _suitToImage() {
    switch (widget.playingCard.cardSuit) {
      case CardSuit.hearts:
        return Image.asset('images/hearts.png');
      case CardSuit.diamonds:
        return Image.asset('images/diamonds.png');
      case CardSuit.clubs:
        return Image.asset('images/clubs.png');
      case CardSuit.spades:
        return Image.asset('images/spades.png');
      default:
        return null;
    }
  }
}
