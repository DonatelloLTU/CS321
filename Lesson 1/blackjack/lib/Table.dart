import 'dart:io';

import 'Deck.dart';
import 'James.dart';
import 'Player.dart';

///Main game engine
///@author Donatas Vasauskas
///@version 2021-01-30.01
void main() {
  bool playing = true;
  Deck deck = new Deck();

  James dl = new James();
  print("Enter your name:");
  Player pl = new Player();
  print("Lets play some Black Jack!!!");
  while (playing == true) {
    if (deck.size() < 4) {
      deck = new Deck();
    }
    pl.clearHand();
    dl.clearHand();
    if (dl.getStash() <= 0 || pl.getStash() <= 0) {
      break;
    }
    int plStash = pl.getStash();
    String plName = pl.getName();

    int dlStash = dl.getStash();
    String dlName = dl.getName();

    print("$plName has in his stash: $plStash");

    print("$dlName has in his stash: $dlStash");

    print("How much do you want to bet?");
    String betString = stdin.readLineSync();
    var bet = int.parse(betString);
    if (bet > plStash) {
      print("Illegal bet!!!");
      continue;
    }
    if (plStash <= 0 || dlStash <= 0) {
      print("Game over, $plName has $plStash , James has $dlStash");
    }
    pl.takeOutStash(bet);

    dl.takeOutStash(bet);
    int bank = bet * 2;

    for (int i = 0; i < 2; i++) {
      pl.addCard(deck.draw());

      dl.addCard(deck.draw());
    }
    int plValues = pl.handValue();

    int dlValues = dl.handValue();
    print("$plName has value of  $plValues");

    print("$dlName has value of  $dlValues");

    if (plValues == 21) {
      print("Winner, winner chicken dinner: $plName is a winner");

      pl.addToStash(bank);
      continue;
    }

    print(
        "Type 1 to get another card, 2 for ending drawing card, 3 to end the game");
    String hitOrStopString = stdin.readLineSync();
    var hitOrStop = int.parse(hitOrStopString);
    if (hitOrStop == 3) {
      print("Game over, $plName has $plStash , James has $dlStash");
      exit(1);
    }
    while (hitOrStop == 1) {
      pl.addCard(deck.draw());
      int plValues = pl.handValue();
      int dlValues = dl.handValue();
      print("$plName has value of  $plValues");
      print("$dlName has value of  $dlValues");

      if (plValues > 21 || dlValues == 21) {
        print("Game over, James has won the round $bank!");

        dl.addToStash(bank);
        break;
      }
      print("Type 1 to get another card, 2 for ending drawing card");
      String hitOrStopString = stdin.readLineSync();
      var hitOrStop = int.parse(hitOrStopString);
      if (hitOrStop == 1) {
        continue;
      } else {
        hitOrStop = 2;
        break;
      }
    }
    plValues = pl.handValue();
    hitOrStop = 2;
    while (hitOrStop == 2) {
      if (plValues > 21) {
        break;
      }
      while (dlValues < 16) {
        dl.addCard(deck.draw());
        int dlValues = dl.handValue();
        print("$plName has value of  $plValues");
        print("$dlName has value of  $dlValues");
        if (dlValues < 16 && plValues > dlValues) {
          continue;
        }
        if (dlValues > 21) {
          break;
        } else if (dlValues > 16) {
          break;
        }
      }
      int dlValues1 = dl.handValue();
      if (plValues > dlValues1 && plValues < 22) {
        ///print("$plName has value of  $plValues");
        ///print("$dlName has value of  $dlValues1");
        print("Player has won $bank!");
        pl.addToStash(bank);
        break;
      } else if (plValues < dlValues1 && dlValues1 < 22) {
        int dlValues1 = dl.handValue();

        ///print("$plName has value of  $plValues");
        ///print("$dlName has value of  $dlValues1");
        print("James has won $bank!");
        dl.addToStash(bank);
        break;
      } else if (plValues == dlValues1) {
        int dlValues1 = dl.handValue();
        //print("$plName has value of  $plValues");
        //print("$dlName has value of  $dlValues1");
        print("It's a tie!");
        int split = (bank / 2).toInt();
        dl.addToStash(split);
        pl.addToStash(split);
        break;
      } else {
        print("Player has won $bank!");
        pl.addToStash(bank);
        break;
      }
    }
    continue;
  }
}
