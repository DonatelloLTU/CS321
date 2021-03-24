import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget heart() {
  return Text(
    '♥',
    style: TextStyle(color: Colors.red, fontSize: 20),
  );
}

Widget diamonds() {
  return Text(
    '♦',
    style: TextStyle(color: Colors.red, fontSize: 20),
  );
}

Widget clubs() {
  return Text(
    '♣',
    style: TextStyle(color: Colors.black, fontSize: 20),
  );
}

Widget spades() {
  return Text(
    '♠',
    style: TextStyle(color: Colors.black, fontSize: 20),
  );
}
