import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Item selectedUser;
  List<Item> users = <Item>[
    const Item(
        'Kaunas',
        Icon(
          Icons.location_city,
          color: const Color(0xFFFFCA28),
        )),
    const Item(
        'London',
        Icon(
          Icons.location_city,
          color: const Color(0xFFFFCA28),
        )),
    const Item(
        'Ravenswood',
        Icon(
          Icons.location_city,
          color: const Color(0xFFFFCA28),
        )),
    const Item(
        'Oslo',
        Icon(
          Icons.location_city,
          color: const Color(0xFFFFCA28),
        )),
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            DrawerHeader(
              child: Text(
                'Weather app',
                style: TextStyle(
                  fontSize: 40,
                  //fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..strokeWidth = 3
                    ..color = Colors.white,
                ),
              ),
              decoration: BoxDecoration(color: Colors.amber),
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelText: 'Search',
              ),

              //add from here ...
              onTap: () {
                showSearch(
                  context: context,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            ListTile(
              title: Text('Back'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ]),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFFFCA28),
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Weather App'),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
                child: Placeholder(),
                // child: AdmobBanner(
                //   adUnitId: null,
                //   adSize: AdmobBannerSize.BANNER,
                // ),
              ),
              // AdmobBanner(
              //   adUnitId: null,
              //   adSize: AdmobBannerSize.BANNER,
              // ),
              DropdownButton<Item>(
                hint: Text("Select item"),
                value: selectedUser,
                onChanged: (Item Value) {
                  setState(() {
                    selectedUser = Value;
                  });
                },
                items: users.map((Item user) {
                  return DropdownMenuItem<Item>(
                    value: user,
                    child: Row(
                      children: <Widget>[
                        user.icon,
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          user.name,
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Colors.amber,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(text: 'Hourly'),
                              Tab(text: 'Daily'),
                            ],
                          ),
                        ),
                        Container(
                            height: 200, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Container(
                                child: Center(
                                  child: Text('Hourly table summary',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Container(
                                child: Center(
                                  child: Text('Daily table summary',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ]))
                      ])),
              DefaultTabController(
                  length: 2, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          child: TabBar(
                            labelColor: Colors.amber,
                            unselectedLabelColor: Colors.black,
                            tabs: [
                              Tab(text: 'Sun'),
                              Tab(text: 'Moon'),
                            ],
                          ),
                        ),
                        Container(
                            height: 250, //height of TabBarView
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Container(
                                height: 10,
                                child: Center(
                                  child: ListView(
                                    padding: const EdgeInsets.all(8),
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        color: Colors.amber[300],
                                        child: const Center(
                                            child: Text('Chart 1')),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.amber[100],
                                        child: const Center(
                                            child: Text('Chart 2')),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.amber[300],
                                        child: const Center(
                                            child: Text('Chart 3')),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 10,
                                child: Center(
                                  child: ListView(
                                    padding: const EdgeInsets.all(8),
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        color: Colors.amber[300],
                                        child: const Center(
                                            child: Text('Chart 1')),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.amber[100],
                                        child: const Center(
                                            child: Text('Chart 2')),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.amber[300],
                                        child: const Center(
                                            child: Text('Chart 3')),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]))
                      ])),
            ],
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}
