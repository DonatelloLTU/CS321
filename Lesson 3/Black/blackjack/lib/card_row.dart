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
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 10.0 * 15.0,
      width: 80,
      margin: EdgeInsets.all(0),
      child: DragTarget<Map>(
        builder: (context, listOne, listTwo) {
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
        },
        onWillAccept: (value) {
          // If empty, accept
          if (widget.cards.length == 0) {
            return true;
          }

          return true;
        },
        onAccept: (value) {
          widget.onCardsAdded(
            value["cards"],
            value["fromIndex"],
          );
        },
      ),
    );
  }
}
