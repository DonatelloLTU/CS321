import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'countries/country_state_city_picker.dart';

void main() => runApp(MaterialApp(
      title: "Weather App",
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var currently;
  var humidity;
  var windSpeed;
  var lat;
  var lon;
  String cityValue;
  String countryValue;
  String stateValue;

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Ravenswood&units=imperial&appid=f3594c0189b761d6bb32d738b3cbccf8");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
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
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 600,
              child: Column(
                children: [
                  SelectState(
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged: (value) {
                      setState(() {
                        cityValue = value;
                      });
                    },
                  ),
                ],
              ),
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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                                  child: Expanded(
                                      child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: ListView(
                                  children: <Widget>[
                                    ListTile(
                                      leading: FaIcon(
                                          FontAwesomeIcons.thermometerHalf),
                                      title: Text("Temperature"),
                                      trailing: Text(temp != null
                                          ? temp.toString() + "\u00B0"
                                          : "Loading"),
                                    ),
                                    ListTile(
                                      leading: FaIcon(FontAwesomeIcons.cloud),
                                      title: Text("Weather"),
                                      trailing: Text(description != null
                                          ? description.toString()
                                          : "Loading"),
                                    ),
                                    ListTile(
                                      leading: FaIcon(FontAwesomeIcons.sun),
                                      title: Text("Humidity"),
                                      trailing: Text(humidity != null
                                          ? humidity.toString()
                                          : "Loading"),
                                    ),
                                    ListTile(
                                      leading: FaIcon(FontAwesomeIcons.wind),
                                      title: Text("Wind Speed"),
                                      trailing: Text(windSpeed != null
                                          ? windSpeed.toString()
                                          : "Loading"),
                                    )
                                  ],
                                ),
                              ))),
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
                                        color: Colors.blueAccent,
                                        child: const Center(
                                            child: Text('Chart 1')),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.lightBlueAccent,
                                        child: const Center(
                                            child: Text('Chart 2')),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.blueAccent,
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
