import 'package:blackjack/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'player.dart';

void main() => runApp(MyApp());

///
///MyApp class main class
///@author: Donatas Vasauskas
///@version: 2021-3-29.01

class MyApp extends StatelessWidget {
  static const String _title = 'Sign In';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  String name;
  String stash;
  Player pl;
  void _setText() {
    setState(() {
      // text = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your name',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your name';
              }
              name = value;

              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter ammount',
            ),
            validator: (value1) {
              if (value1.isEmpty ||
                  !RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$')
                      .hasMatch(value1)) {
                return 'Please enter ammount in numbers';
              }
              stash = value1;

              //return stash;
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _navigateToSecondScreen(context);
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToSecondScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GameTable(playerName: name, playerStash: stash),
        ));
  }

// String getName() {
//   return name;
// }
//
// String getStash() {
//   return stash;
// }
}
