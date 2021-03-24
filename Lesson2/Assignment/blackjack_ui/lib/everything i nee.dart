// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage>
// //     with SingleTickerProviderStateMixin {
// //   Animation<double> _animation;
// //   AnimationStatus _animationStatus = AnimationStatus.dismissed;
// //   AnimationController _animationController;
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //
// //     _animationController =
// //         AnimationController(duration: Duration(milliseconds: 200), vsync: this);
// //
// //     _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
// //       ..addListener(() {
// //         setState(() {});
// //       })
// //       ..addStatusListener((status) {
// //         _animationStatus = status;
// //       });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         backgroundColor: Colors.green,
// //         body: Center(
// //             child: Container(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                 ],
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [MyChips(), MyChips(), MyChips()],
// //               ),
// //               MyCard(),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [MyChips(), MyChips(), MyChips()],
// //               ),
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                   CardTemp(),
// //                 ],
// //               )
// //             ],
// //           ),
// //         )));
// //   }
// // }
class BlackJackUI extends StatelessWidget {
  static const String _title = 'Sign In';

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

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

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
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter ammount',
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter ammount';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                _navigateToSecondScreen(context);
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
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
          builder: (context) => BlackJackUIGame(),
        ));
  }
}

class BlackJackUIGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Center(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Should be ammount'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [MyChips(), MyChips(), MyChips()],
              ),
              MyCard(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [MyChips(), MyChips(), MyChips()],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                  CardTemp(),
                ],
              ),
              Text('Should be name'),
              Text('Should be ammount'),
            ],
          ),
        )));
  }
}
