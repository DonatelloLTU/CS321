import 'dart:math';

import 'package:blackjack/card_row.dart';
import 'package:blackjack/move_card.dart';
import 'package:blackjack/playing_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String playerName;
  final String playerStash;

  const GameScreen({Key key, this.playerName, this.playerStash})
      : super(key: key);
  //GameScreen();
  //final String namePlayers;
  //final String stashPlayers;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  //Navigator.pop(context);

  List<PlayingCard> cardColumn1 = [];
  List<PlayingCard> cardColumn2 = [];
  int count = 0;
  int dealersCount = 0;
  int gamesPlayed = 0;
  List<PlayingCard> cardDeckClosed = [];
  List<PlayingCard> cardDeckOpened = []; //used cards

  @override
  void initState() {
    super.initState();
    _initialiseGame();
  }

  @override
  Widget build(BuildContext context) {
    int values, dealersValue;
    count = 0;
    for (int i = 0; i < cardColumn1.length; i++) {
      values = cardColumn1.elementAt(i).getValue();
      if (values > 10) {
        values = 10;
      }
      count = count + values;
    }

    dealersCount = 0;
    for (int i = 0; i < cardColumn2.length; i++) {
      dealersValue = cardColumn2.elementAt(i).getValue();
      if (dealersValue > 10) {
        dealersValue = 10;
      }
      dealersCount = dealersCount + dealersValue;
    }

    return Scaffold(
      backgroundColor: Colors.green,
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          DrawerHeader(
            child: Text(
              'Your stats',
              style: TextStyle(
                fontSize: 40,
                //fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..strokeWidth = 6
                  ..color = Colors.white,
              ),
            ),
            decoration: BoxDecoration(color: Colors.red),
          ),
          ListTile(title: Text('Hands played: ' + gamesPlayed.toString())),
          ListTile(title: Text('Win/Loose ratio: ')),
          ListTile(title: Text('Avg Score: ')),
          ListTile(
            title: Text('Back'),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ]),
      ),
      appBar: AppBar(
        title: Text("BlackJack"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
            splashColor: Colors.white,
            onTap: () {
              _initialiseGame();
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Score: " + dealersCount.toString()),
              CardColumn(
                cards: cardColumn2,
                onCardsAdded: (cards, index) {
                  setState(() {
                    cardColumn2.addAll(cards);
                    int length = _getListFromIndex(index).length;
                    _getListFromIndex(index)
                        .removeRange(length - cards.length, length);
                    //_refreshList(index);
                  });
                },
                columnIndex: 2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildCardDeck(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[_buildChip(), _buildChip1(), _buildChip2()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${widget.playerName}'),
                  Text('Stash: ${widget.playerStash}'),
                  Text("Score: " + count.toString()),
                ],
              ),
              CardColumn(
                cards: cardColumn1,
                onCardsAdded: (cards, index) {
                  setState(() {
                    cardColumn1.addAll(cards);
                    int length = _getListFromIndex(index).length;
                    _getListFromIndex(index)
                        .removeRange(length - cards.length, length);
                    _refreshList(index);
                  });
                },
                columnIndex: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build the deck of cards left after building card columns
  Widget _buildCardDeck() {
    return Container(
      child: Row(
        children: <Widget>[
          InkWell(
            child: cardDeckClosed.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TransformedCard(
                      playingCard: cardDeckClosed.last,
                    ),
                  )
                : Opacity(
                    opacity: 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TransformedCard(
                        playingCard: PlayingCard(
                          cardSuit: CardSuit.diamonds,
                          cardType: CardType.five,
                        ),
                      ),
                    ),
                  ),
            onTap: () {
              setState(() {
                //add statements about if stop or burn then add to dealer
                if (cardDeckClosed.isEmpty) {
                  cardDeckClosed.addAll(cardDeckOpened.map((card) {
                    return card
                      ..opened = false
                      ..faceUp = false;
                  }));
                  cardDeckOpened.clear();
                } else {
                  cardColumn1.add(
                    cardDeckClosed.removeLast()
                      ..faceUp = true
                      ..opened = true,
                  );
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildChip() {
    return Container(
      child: Center(
        child: Text(
          "10",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }

  Widget _buildChip1() {
    return Container(
      child: Center(
        child: Text(
          "100",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }

  Widget _buildChip2() {
    return Container(
      child: Center(
        child: Text(
          "All in!",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }

  // Initialise a new game
  void _initialiseGame() {
    gamesPlayed++;
    count = 0;

    cardColumn1 = [];
    cardColumn2 = [];

    // Stores the card deck
    cardDeckClosed = [];
    cardDeckOpened = []; //used cards

    List<PlayingCard> allCards = [];

    // Add all cards to deck
    CardSuit.values.forEach((suit) {
      CardType.values.forEach((type) {
        allCards.add(PlayingCard(
          cardType: type,
          cardSuit: suit,
          faceUp: false,
        ));
      });
    });

    Random random = Random();

    // Add cards to columns and remaining to deck
    for (int i = 1; i < 6; i++) {
      int randomNumber = random.nextInt(allCards.length);

      if (i > 0 && i < 3) {
        PlayingCard card = allCards[randomNumber];
        cardColumn1.add(
          card
            ..opened = true
            ..faceUp = true,
        );

        allCards.removeAt(randomNumber);
      } else if (i > 3 && i < 6) {
        if (i == 5) {
          PlayingCard card = allCards[randomNumber];
          cardColumn2.add(
            card
              ..opened = true
              ..faceUp = true,
          );
        } else {
          cardColumn2.add(allCards[randomNumber]);
        }
        allCards.removeAt(randomNumber);
      }
    }
    allCards.shuffle();
    cardDeckClosed = allCards;
    setState(() {});
  }

  void _refreshList(int index) {
    setState(() {
      if (_getListFromIndex(index).length != 0) {
        _getListFromIndex(index)[_getListFromIndex(index).length - 1]
          ..opened = true
          ..faceUp = true;
      }
    });
  }

  void _handleWin() {
    if (count > dealersCount) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Congratulations!"),
            content: Text("You Win!"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _initialiseGame();
                  Navigator.pop(context);
                },
                child: Text("Play again"),
              ),
            ],
          );
        },
      );
    }
  }

  List<PlayingCard> _getListFromIndex(int index) {
    switch (index) {
      case 0:
        return cardDeckOpened;
      case 1:
        return cardColumn1;
      case 2:
        return cardColumn2;

      default:
        return null;
    }
  }
}
