import 'package:blackjack/move_card.dart';
import 'package:blackjack/playing_card.dart';
import 'package:flutter/material.dart';

typedef Null CardAcceptCallback(List<PlayingCard> card, int fromIndex);

class CardColumn extends StatefulWidget {
  final List<PlayingCard> cards;

  final CardAcceptCallback onCardsAdded;

  final int columnIndex;

  CardColumn({this.cards, this.onCardsAdded, this.columnIndex});

  @override
  _CardColumnState createState() => _CardColumnState();
}

class _CardColumnState extends State<CardColumn> {
  double _height = 10.0 * 15.0;
  double _width = 80;

  double _updateState() {
    setState(() {
      _width = 40;
      _height = 5.0 * 7.0;
    });
  }

  bool dealersTurn;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 2000),
      alignment: Alignment.topCenter,
      height: _height,
      width: _width,
      margin: EdgeInsets.all(0),
      child: DragTarget<Map>(builder: (context, listOne, listTwo) {
        return Stack(
          //alignment: AlignmentDirectional.bottomCenter,
          children: widget.cards.map((card) {
            int index = widget.cards.indexOf(card);
            return TransformedCard(
              playingCard: card,
              transformIndex: index,
              attachedCards: widget.cards.sublist(index, widget.cards.length),
              columnIndex: widget.columnIndex,
            );
          }).toList(),
        );
      }, onMove: (value) {
        //_updateState();
        //dealersTurn = true;
        //return dealersTurn;
      }),
    );
  }
}
