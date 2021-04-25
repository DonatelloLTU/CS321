import 'package:blackjack_ui/everything%20i%20nee.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(BlackJackUI());
}

class BlackJackUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
