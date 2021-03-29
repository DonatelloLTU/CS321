import 'dart:math';

import 'package:blackjack/card_row.dart';
import 'package:blackjack/main.dart';
import 'package:blackjack/move_card.dart';
import 'package:blackjack/playing_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

///
///GameTable class responsible for the UI
///@author: Donatas Vasauskas
///@version: 2021-3-29.01
///Reference: https://medium.com/flutter-community/creating-solitaire-in-flutter-946c34ef053c
class GameTable extends StatefulWidget {
  String playerName;
  String playerStash;

  GameTable({Key key, this.playerName, this.playerStash}) : super(key: key);

  //GameTable();
  //final String namePlayers;
  //final String stashPlayers;
  @override
  _GameTableState createState() => _GameTableState();
}

int totalPot = 0;
bool betting = true;
int getCard = 0;
bool dealersTurn = false;
int win = 0;
int loss = 0;
bool _visible = false;
String dealersPoints = ' ';
//bool showPoints = false;

///
/// State class of GameTable
class _GameTableState extends State<GameTable> {
  //Navigator.pop(context);

  List<PlayingCard> cardColumn1 = [];
  List<PlayingCard> cardColumn2 = [];
  int count = 0;
  int dealersCount = 0;
  int gamesPlayed = 0;

  List<PlayingCard> cardDeckClosed = [];
  //List<PlayingCard> cardDeckOpened = []; //used cards

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
      if (values < 2 && count < 22) {
        values = 11;
      }
      if (count > 21 && values < 2) {
        values = 1;
      }

      count = count + values;
    }

    dealersCount = 0;
    for (int i = 0; i < cardColumn2.length; i++) {
      dealersValue = cardColumn2.elementAt(i).getValue();
      if (dealersValue > 10) {
        dealersValue = 10;
      }
      if (values < 2) {
        values = 11;
        if (count > 21) {
          values = 1;
        }
      }
      dealersCount = dealersCount + dealersValue;
    }

    ///
    /// Main App style build for the game
    ///
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
          ListTile(
              title: Text('Win/Loose ratio: ' +
                  win.toString() +
                  '/' +
                  loss.toString())),
          ListTile(
              title: Text(
                  'Rules are simple, to get a card and give a card to opponent press on the deck in the middle of the screen. Opponent can receive card only when you are finished with your turn. Beat opponent by having higher score. Higher score does not mean that you can go to infinity. Your turn will end if you get above 21. GOOD LUCK!!!')),
          ListTile(
            title: Text('Back ->'),
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
              Text(""),
              Text(""),
              CardColumn(
                cards: cardColumn2,
                onCardsAdded: (cards, index) {
                  setState(() {
                    cardColumn2.addAll(cards);
                    int length = _getListFromIndex(index).length;
                    _getListFromIndex(index)
                        .removeRange(length - cards.length, length);
                    _refreshList(index);
                  });
                },
                columnIndex: 2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Pot: $totalPot'),
              _buildCardDeck(),
              _deal(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_swipeToPass()],
          )
        ],
      ),
    );
  }

  //Color _color = Colors.white;
  Color _colors = Colors.white;
  RandomColor _randomColor = RandomColor();
  Color _updateColor() {
    setState(() {
      _colors = _randomColor.randomColor();
    });
  }

  Widget _swipeToPass() {
    return Visibility(
      visible: _visible,
      child: Dismissible(
        key: UniqueKey(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 5000),
          child: InkWell(
            child: Center(
              child: Text(
                "Swipe to pass",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          height: 40.0,
          width: 100.0,
          decoration: BoxDecoration(
            color: _colors,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            _updateColor();
            //showPoints = true;
            // dealersPoints = dealersCount.toString();
            _visible = !_visible;

            PlayingCard card = cardColumn2.first;
            card
              ..faceUp = true
              ..opened = true;
            dealersTurn = true;
          });
        },
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
                if (count > 21) {
                  _handleWin();
                }
                if (totalPot == 0) {
                  _makeBet();
                }
                //_handleWin();
                if (betting == false) {
                  if (totalPot != 0) {
                    if (count < 22 && dealersTurn != true) {
                      cardColumn1.add(
                        cardDeckClosed.removeLast()
                          ..faceUp = true
                          ..opened = true,
                      );
                    }

                    if (dealersTurn == true) {
                      if (dealersCount > 16) {
                        _handleWin();
                      }
                      if (dealersCount < 17 && count < 22) {
                        cardColumn2.add(
                          cardDeckClosed.removeLast()
                            ..faceUp = true
                            ..opened = true,
                        );
                      }
                    }
                  }
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
      child: InkWell(
        child: Center(
          child: Text(
            "10",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          setState(() {
            int numberStash = int.parse(widget.playerStash);
            if (betting == true || totalPot == 0) {
              if (numberStash >= 10) {
                numberStash = numberStash - 10;
                widget.playerStash = numberStash.toString();
                totalPot = totalPot + 20;
              }
            } else {
              _noBet();
            }
          });
        },
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
      child: InkWell(
        child: Center(
          child: Text(
            "100",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          setState(() {
            int numberStash = int.parse(widget.playerStash);
            if (betting == true || totalPot == 0) {
              if (numberStash >= 100) {
                numberStash = numberStash - 100;
                widget.playerStash = numberStash.toString();
                totalPot = totalPot + 200;
              }
            } else {
              _noBet();
            }
          });
        },
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
      child: InkWell(
        child: Center(
          child: Text(
            "All in!",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          setState(() {
            int numberStash = int.parse(widget.playerStash);
            if (betting == true || totalPot == 0) {
              if (numberStash > 1) {
                totalPot = totalPot + (numberStash * 2);
                numberStash = 0;
                widget.playerStash = numberStash.toString();
              }
            } else {
              _noBet();
            }
          });
        },
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
    dealersPoints = " ";
    dealersTurn = false;

    gamesPlayed++;
    count = 0;

    cardColumn1 = [];
    cardColumn2 = [];

    // Stores the card deck
    cardDeckClosed = [];
    //cardDeckOpened = []; //used cards

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

    if (totalPot != 0) {
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
    }
    allCards.shuffle();
    cardDeckClosed = allCards;
    setState(() {});
  }

  void _refreshList(int index) {
    setState(() {
      if (_getListFromIndex(index).length != 0) {
        _getListFromIndex(index)[_getListFromIndex(index).length]
          ..opened = true
          ..faceUp = true;
      }
    });
  }

  void _handleWin() {
    if ((count == 21 && count != dealersCount) ||
        dealersCount > 21 ||
        (dealersCount < count && count < 22)) {
      showDialog(
        context: context,
        builder: (context) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 2000),
            curve: Curves.bounceIn,
            child: AlertDialog(
              title: Text("Congratulations!"),
              content: Text("You Win!"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    int stashing = int.parse(widget.playerStash);
                    stashing = stashing + totalPot;
                    widget.playerStash = stashing.toString();
                    totalPot = 0;
                    win = win + 1;
                    betting = true;

                    _initialiseGame();
                    Navigator.pop(context);
                    _gameOver();
                  },
                  child: Text("Play again"),
                ),
              ],
            ),
          );
        },
      );
    }
    if (count > 21 || (dealersCount > count && dealersCount < 22)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Burn!"),
            content: Text("You Loose!"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  totalPot = 0;
                  loss = loss + 1;

                  _initialiseGame();
                  betting = true;
                  Navigator.pop(context);
                  _gameOver();
                },
                child: Text("Play again"),
              ),
            ],
          );
        },
      );
    }
    if (count < 22 && count == dealersCount) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Tie!"),
            content: Text("Split the pot!"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  //int stashing = int.parse(widget.playerStash);
                  //stashing = stashing + (totalPot / 2);
                  //widget.playerStash = stashing.toString();
                  totalPot = 0;
                  // loss = loss + 1;
                  _initialiseGame();
                  betting = true;
                  Navigator.pop(context);
                  _gameOver();
                },
                child: Text("Play again"),
              ),
            ],
          );
        },
      );
    }
    dealersPoints = '';
  }

  void _gameOver() {
    int testStash = int.parse(widget.playerStash);
    if (testStash == 0) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Game Over!"),
            content: Text("You lost all your money!"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  _navigateToFirstScreen(context);
                },
                child: Text("Play again"),
              ),
            ],
          );
        },
      );
    }
  }

  void _navigateToFirstScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ));
  }

  void _makeBet() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Big no no!"),
          content: Text("Make a bet!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        );
      },
    );
  }

  void _noBet() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Big no no!"),
          content: Text("You cannot bet while in game!"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back"),
            ),
          ],
        );
      },
    );
  }

  Widget _deal() {
    return Container(
      child: InkWell(
        child: Center(
          child: Text(
            "Deal",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          setState(() {
            _visible = true;
            if (betting == true) {
              if (totalPot != 0) {
                betting = false;
                _initialiseGame();
              } else {
                _makeBet();
              }
            }
          });
        },
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

  List<PlayingCard> _getListFromIndex(int index) {
    switch (index) {
      case 0:
      //return cardDeckOpened;
      case 1:
        return cardColumn1;
      case 2:
        return cardColumn2;

      default:
        return null;
    }
  }
}
