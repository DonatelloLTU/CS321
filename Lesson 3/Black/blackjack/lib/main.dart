import 'package:blackjack/table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'player.dart';

void main() => runApp(MyApp());

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

              return name;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter ammount',
            ),
            validator: (value1) {
              if (value1.isEmpty) {
                return 'Please enter ammount';
              }
              stash = value1;

              return stash;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                _navigateToSecondScreen(context);
                if (_formKey.currentState.validate()) {
                  // Process data.
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
