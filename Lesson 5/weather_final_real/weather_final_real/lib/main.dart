import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'WeatherWidget.dart';
import 'ad_state.dart';
import 'bezier-chart/lib/bezier_chart.dart';
import 'countries/country_state_city_picker.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(
    Provider.value(
        value: adState,
        builder: (context, child) => MaterialApp(
              title: "Weather App",
              home: Home(),
            )),
  );
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  BannerAd banner;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: AdRequest(),
          listener: adState.adListener,
        )..load();
      });
    });
  }

  final _formKey = GlobalKey<FormState>();
  var arr = List(10);
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
  String dayOne = '';
  var one;
  var two;
  var three;
  var four;
  var five;
  var oneDay;
  var oneDaym;
  var twoDay;
  var twoDaym;
  var threeDay;
  var threeDaym;
  var fourDay;
  var fourDaym;
  var fiveDay;
  var fiveDaym;

  DateTime dt = DateTime.now();
  String day;
  String month;
  String year;
  DateTime dt1;
  String formattedDt1;
  DateTime dt2;
  String formattedDt2;
  DateTime dt3;
  String formattedDt3;
  DateTime dt4;
  String formattedDt4;
  DateTime dt5;
  String formattedDt5;
  DateTime dt1Day;
  String formattedDt1Day;
  DateTime dt2Day;
  String formattedDt2Day;
  DateTime dt3Day;
  String formattedDt3Day;
  DateTime dt4Day;
  String formattedDt4Day;
  DateTime dt5Day;
  String formattedDt5Day;

  var feels0;
  var feels1;
  var feels2;
  var feels3;
  var feels4;
  var feels5;

  var description0;
  var description1;
  var description2;
  var description3;
  var description4;
  var description5;

  var humidity0;
  var humidity1;
  var humidity2;
  var humidity3;
  var humidity4;
  var humidity5;

  var dewPoint0;
  var dewPoint1;
  var dewPoint2;
  var dewPoint3;
  var dewPoint4;
  var dewPoint5;

  var cloudCoverage0;
  var cloudCoverage1;
  var cloudCoverage2;
  var cloudCoverage3;
  var cloudCoverage4;
  var cloudCoverage5;

  var visibility0;
  var visibility1;
  var visibility2;
  var visibility3;
  var visibility4;
  var visibility5;

  var windSpeed1;
  var windSpeed2;
  var windSpeed3;
  var windSpeed4;
  var windSpeed5;

  var temp1;
  var temp2;
  var temp3;
  var temp4;
  var temp5;

  var feels0Day;
  var feels1Day;
  var feels2Day;
  var feels3Day;
  var feels4Day;
  var feels5Day;

  var description0Day;
  var description1Day;
  var description2Day;
  var description3Day;
  var description4Day;
  var description5Day;

  var humidity0Day;
  var humidity1Day;
  var humidity2Day;
  var humidity3Day;
  var humidity4Day;
  var humidity5Day;

  var dewPoint0Day;
  var dewPoint1Day;
  var dewPoint2Day;
  var dewPoint3Day;
  var dewPoint4Day;
  var dewPoint5Day;

  var cloudCoverage0Day;
  var cloudCoverage1Day;
  var cloudCoverage2Day;
  var cloudCoverage3Day;
  var cloudCoverage4Day;
  var cloudCoverage5Day;

  var visibility0Day;
  var visibility1Day;
  var visibility2Day;
  var visibility3Day;
  var visibility4Day;
  var visibility5Day;

  var windSpeed1Day;
  var windSpeed2Day;
  var windSpeed3Day;
  var windSpeed4Day;
  var windSpeed5Day;

  var windDir1 = -1;
  var windDir1Double = -1;
  var windDir2 = -1;
  var windDir2Double = -1;
  var windDir3 = -1;
  var windDir3Double = -1;
  var windDir4 = -1;
  var windDir4Double = -1;
  var windDir5 = -1;
  var windDir5Double = -1;
  var windDirDay1 = -1;
  var windDirDay1Double = -1;
  var windDirDay2 = -1;
  var windDirDay2Double = -1;
  var windDirDay3 = -1;
  var windDirDay3Double = -1;
  var windDirDay4 = -1;
  var windDirDay4Double = -1;
  var windDirDay5 = -1;
  var windDirDay5Double = -1;

  var sunrise;
  var sunset;
  var solarNoon;
  var solarMidnight;
  var hrOfDay;
  var hrOfDark;
  var moonPhase;
  var moonRise;
  var lunarNoon;
  var moonSet;
  var lunarMidnight;
  var nextFull;
  var nextNew;
  String units;

  double chartDay1Double = 0;

  double chartDay2Double = 0;

  double chartDay3Double = 0;

  double chartDay4Double = 0;

  double chartDay5Double = 0;

  double chartH1Double = 0;

  double chartH2Double = 0;

  double chartH3Double = 0;

  double chartH4Double = 0;

  double chartH5Double = 0;

  double chartDay11Double = 0;

  double chartDay12Double = 0;

  double chartDay13Double = 0;

  double chartDay14Double = 0;

  double chartDay15Double = 0;

  double chartH11Double = 0;

  double chartH12Double = 0;

  double chartH13Double = 0;

  double chartH14Double = 0;

  double chartH15Double = 0;

  bool isSwitched = false;

  String weatherBcgrnd = "Sunny";
  bool _isVisible = true;
  bool _cloudIsVisible = false;
  bool _thunderIsVisible = false;
  bool _snowIsVisible = false;
  bool _rainIsVisible = false;

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=" +
            selectedUser.name +
            "&units=" +
            units.toString() +
            "&appid=f3594c0189b761d6bb32d738b3cbccf8");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];

      this.description = results['weather'][0]['description'];
      this.currently = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windSpeed = results['wind']['speed'];
      this.lat = results['coord']['lat'];
      this.lon = results['coord']['lon'];
    });
    http.Response response1 = await http.get(
        "https://api.openweathermap.org/data/2.5/onecall?lat=" +
            lat.toString() +
            "&lon=" +
            lon.toString() +
            "&units=" +
            units.toString() +
            "&exclude=current,minutely,alerts&appid=f3594c0189b761d6bb32d738b3cbccf8");
    var results1 = jsonDecode(response1.body);
    setState(() {
      /*
      Hourly temperature, wind, direction, time
       */
      //in an hour
      this.day = DateFormat.d().format(dt);
      this.month = DateFormat.MMMM().format(dt);
      this.year = DateFormat.y().format(dt);
      this.one = results1['hourly'][3]['temp'];
      dt1 = dt.add(new Duration(hours: 1));
      chartDay1Double = double.parse(one.toString());
      formattedDt1 = DateFormat.Hms().format(dt1);
      this.feels1 = results1['hourly'][3]['feels_like'];
      this.description1 = results1['hourly'][3]['weather'][0]['description'];
      this.humidity1 = results1['hourly'][3]['humidity'];
      this.dewPoint1 = results1['hourly'][3]['dew_point'];
      this.cloudCoverage1 = results1['hourly'][3]['clouds'];
      this.visibility1 = results1['hourly'][3]['visibility'];
      this.windSpeed1 = results1['hourly'][3]['wind_speed'];
      this.windDir1 = results1['hourly'][3]['wind_deg'];
      chartDay11Double = double.parse(windSpeed1.toString());

      //in 2 hour
      this.two = results1['hourly'][4]['temp'];
      dt2 = dt.add(new Duration(hours: 2));
      formattedDt2 = DateFormat.Hms().format(dt2);

      chartDay2Double = double.parse(two.toString());
      this.feels2 = results1['hourly'][4]['feels_like'];
      this.description2 = results1['hourly'][4]['weather'][0]['description'];
      this.humidity2 = results1['hourly'][4]['humidity'];
      this.dewPoint2 = results1['hourly'][4]['dew_point'];
      this.cloudCoverage2 = results1['hourly'][4]['clouds'];
      this.visibility2 = results1['hourly'][4]['visibility'];
      this.windSpeed2 = results1['hourly'][4]['wind_speed'];
      this.windDir2 = results1['hourly'][4]['wind_deg'];
      chartDay12Double = double.parse(windSpeed2.toString());

      //in 3 hours
      this.three = results1['hourly'][5]['temp'];
      dt3 = dt.add(new Duration(hours: 3));
      formattedDt3 = DateFormat.Hms().format(dt3);
      chartDay3Double = double.parse(three.toString());
      this.feels3 = results1['hourly'][5]['feels_like'];
      this.description3 = results1['hourly'][5]['weather'][0]['description'];
      this.humidity3 = results1['hourly'][5]['humidity'];
      this.dewPoint3 = results1['hourly'][5]['dew_point'];
      this.cloudCoverage3 = results1['hourly'][5]['clouds'];
      this.visibility3 = results1['hourly'][5]['visibility'];
      this.windSpeed3 = results1['hourly'][5]['wind_speed'];
      chartDay13Double = double.parse(windSpeed3.toString());
      this.windDir3 = results1['hourly'][5]['wind_deg'];

      //in 4 hours
      this.four = results1['hourly'][6]['temp'];
      dt4 = dt.add(new Duration(hours: 4));
      formattedDt4 = DateFormat.Hms().format(dt4);
      chartDay4Double = double.parse(four.toString());
      this.feels4 = results1['hourly'][6]['feels_like'];
      this.description4 = results1['hourly'][6]['weather'][0]['description'];
      this.humidity4 = results1['hourly'][6]['humidity'];
      this.dewPoint4 = results1['hourly'][6]['dew_point'];
      this.cloudCoverage4 = results1['hourly'][6]['clouds'];
      this.visibility4 = results1['hourly'][6]['visibility'];
      this.windSpeed4 = results1['hourly'][6]['wind_speed'];
      chartDay14Double = double.parse(windSpeed4.toString());
      this.windDir4 = results1['hourly'][6]['wind_deg'];

      //in 5 hours
      this.five = results1['hourly'][7]['temp'];
      dt5 = dt.add(new Duration(hours: 5));
      formattedDt5 = DateFormat.Hms().format(dt5);
      chartDay5Double = double.parse(five.toString());
      this.feels5 = results1['hourly'][7]['feels_like'];
      this.description5 = results1['hourly'][7]['weather'][0]['description'];
      this.humidity5 = results1['hourly'][7]['humidity'];
      this.dewPoint5 = results1['hourly'][7]['dew_point'];
      this.cloudCoverage5 = results1['hourly'][7]['clouds'];
      this.visibility5 = results1['hourly'][7]['visibility'];
      this.windSpeed5 = results1['hourly'][7]['wind_speed'];
      this.windDir5 = results1['hourly'][7]['wind_deg'];
      chartDay15Double = double.parse(windSpeed5.toString());

      /*
      Daily
       */
      //in a day
      this.oneDay = results1['daily'][1]['temp']['max'];
      this.oneDaym = results1['daily'][1]['temp']['min'];
      dt1Day = dt.add(new Duration(hours: 24));
      formattedDt1Day = DateFormat.MMMd().format(dt1Day);
      chartH1Double = double.parse(oneDay.toString());
      this.feels1Day = results1['daily'][1]['feels_like']['day'];
      this.description1Day = results1['daily'][1]['weather'][0]['description'];
      this.humidity1Day = results1['daily'][1]['humidity'];
      this.dewPoint1Day = results1['daily'][1]['dew_point'];
      this.cloudCoverage1Day = results1['daily'][1]['clouds'];
      this.visibility1Day = results1['daily'][1]['weather'][0]['main'];
      this.windSpeed1Day = results1['daily'][1]['wind_speed'];
      this.windDirDay1 = results1['daily'][1]['wind_deg'];
      chartH11Double = double.parse(windSpeed1Day.toString());

      //in 2 days
      this.twoDay = results1['daily'][2]['temp']['max'];
      this.twoDaym = results1['daily'][2]['temp']['min'];
      dt2Day = dt.add(new Duration(hours: 48));
      formattedDt2Day = DateFormat.MMMd().format(dt2Day);
      chartH2Double = double.parse(twoDay.toString());
      this.feels2Day = results1['daily'][2]['feels_like']['day'];
      this.description2Day = results1['daily'][2]['weather'][0]['description'];
      this.humidity2Day = results1['daily'][2]['humidity'];
      this.dewPoint2Day = results1['daily'][2]['dew_point'];
      this.cloudCoverage2Day = results1['daily'][2]['clouds'];
      this.visibility2Day = results1['daily'][2]['weather'][0]['main'];
      this.windSpeed2Day = results1['daily'][2]['wind_speed'];
      this.windDirDay2 = results1['daily'][2]['wind_deg'];
      chartH12Double = double.parse(windSpeed2Day.toString());

      //in 3 days
      this.threeDay = results1['daily'][3]['temp']['max'];
      this.threeDaym = results1['daily'][3]['temp']['min'];
      dt3Day = dt.add(new Duration(hours: 72));
      formattedDt3Day = DateFormat.MMMd().format(dt3Day);
      chartH3Double = double.parse(threeDay.toString());
      this.feels3Day = results1['daily'][3]['feels_like']['day'];
      this.description3Day = results1['daily'][3]['weather'][0]['description'];
      this.humidity3Day = results1['daily'][3]['humidity'];
      this.dewPoint3Day = results1['daily'][3]['dew_point'];
      this.cloudCoverage3Day = results1['daily'][3]['clouds'];
      this.visibility3Day = results1['daily'][3]['weather'][0]['main'];
      this.windSpeed3Day = results1['daily'][3]['wind_speed'];
      this.windDirDay3 = results1['daily'][3]['wind_deg'];
      chartH13Double = double.parse(windSpeed3Day.toString());

      //in 4 days
      this.fourDay = results1['daily'][4]['temp']['max'];
      this.fourDaym = results1['daily'][4]['temp']['min'];
      dt4Day = dt.add(new Duration(hours: 96));
      formattedDt4Day = DateFormat.MMMd().format(dt4Day);
      chartH4Double = double.parse(fourDay.toString());
      this.feels4Day = results1['daily'][4]['feels_like']['day'];
      this.description4Day = results1['daily'][4]['weather'][0]['description'];
      this.humidity4Day = results1['daily'][4]['humidity'];
      this.dewPoint4Day = results1['daily'][4]['dew_point'];
      this.cloudCoverage4Day = results1['daily'][4]['clouds'];
      this.visibility4Day = results1['daily'][4]['weather'][0]['main'];
      this.windSpeed4Day = results1['daily'][4]['wind_speed'];
      this.windDirDay4 = results1['daily'][4]['wind_deg'];
      chartH14Double = double.parse(windSpeed4Day.toString());

      //in 5 days
      this.fiveDay = results1['daily'][5]['temp']['max'];
      this.fiveDaym = results1['daily'][5]['temp']['min'];
      dt5Day = dt.add(new Duration(hours: 120));
      formattedDt5Day = DateFormat.MMMd().format(dt5Day);
      chartH5Double = double.parse(fiveDay.toString());
      this.feels5Day = results1['daily'][5]['feels_like']['day'];
      this.description5Day = results1['daily'][5]['weather'][0]['description'];
      this.humidity5Day = results1['daily'][5]['humidity'];
      this.dewPoint5Day = results1['daily'][5]['dew_point'];
      this.cloudCoverage5Day = results1['daily'][5]['clouds'];
      this.visibility5Day = results1['daily'][5]['weather'][0]['main'];
      this.windSpeed5Day = results1['daily'][5]['wind_speed'];
      this.windDirDay5 = results1['daily'][5]['wind_deg'];
      chartH15Double = double.parse(windSpeed5Day.toString());

      this.changeToDirection();
      this.changeBaground();
      this.getSunMoon();
    });
  }

  Future getSunMoon() async {
    DateTime now = new DateTime.now();
    var date = new DateFormat('yyyy-MM-dd');
    String formattedDate = date.format(now);
    http.Response response3 = await http.get(
        "https://api.met.no/weatherapi/sunrise/2.0/.json?lat=" +
            lat.toString() +
            "&lon=" +
            lon.toString() +
            "&date=" +
            formattedDate +
            "&offset=-05:00");
    var results3 = jsonDecode(response3.body);
    setState(() {
      this.sunrise = results3['location']['time'][0]['sunrise']['time'];
      this.sunset = results3['location']['time'][0]['sunset']['time'];
      this.solarNoon = results3['location']['time'][0]['solarnoon']['time'];
      this.solarMidnight =
          results3['location']['time'][0]['solarmidnight']['time'];
      this.hrOfDay = "";
      this.hrOfDark = "";
      this.moonPhase = results3['location']['time'][0]['moonphase']['time'];
      this.moonRise = results3['location']['time'][0]['moonrise']['time'];
      this.lunarNoon = results3['location']['time'][0]['high_moon']['time'];
      this.moonSet = results3['location']['time'][0]['moonset']['time'];
      this.lunarMidnight = results3['location']['time'][0]['low_moon']['time'];
      this.nextFull = "???";
      this.nextNew = "???";

      const start = "T";
      const end = "-";

      final startIndex = sunrise.toString().indexOf(start);
      final endIndex =
          sunrise.toString().indexOf(end, startIndex + start.length);
      sunrise =
          sunrise.toString().substring(startIndex + start.length, endIndex);

      final startIndex1 = sunset.toString().indexOf(start);
      final endIndex1 =
          sunset.toString().indexOf(end, startIndex1 + start.length);
      sunset =
          sunset.toString().substring(startIndex1 + start.length, endIndex1);

      final startIndex2 = solarNoon.toString().indexOf(start);
      final endIndex2 =
          solarNoon.toString().indexOf(end, startIndex2 + start.length);
      solarNoon =
          solarNoon.toString().substring(startIndex2 + start.length, endIndex2);

      final startIndex3 = solarMidnight.toString().indexOf(start);
      final endIndex3 =
          solarMidnight.toString().indexOf(end, startIndex3 + start.length);
      solarMidnight = solarMidnight
          .toString()
          .substring(startIndex3 + start.length, endIndex3);

      final startIndex4 = moonPhase.toString().indexOf(start);
      final endIndex4 =
          moonPhase.toString().indexOf(end, startIndex4 + start.length);
      moonPhase =
          moonPhase.toString().substring(startIndex4 + start.length, endIndex4);

      final startIndex5 = moonRise.toString().indexOf(start);
      final endIndex5 =
          moonRise.toString().indexOf(end, startIndex5 + start.length);
      moonRise =
          moonRise.toString().substring(startIndex5 + start.length, endIndex5);

      final startIndex6 = lunarNoon.toString().indexOf(start);
      final endIndex6 =
          lunarNoon.toString().indexOf(end, startIndex6 + start.length);
      lunarNoon =
          lunarNoon.toString().substring(startIndex6 + start.length, endIndex6);

      final startIndex7 = moonSet.toString().indexOf(start);
      final endIndex7 =
          moonSet.toString().indexOf(end, startIndex7 + start.length);
      moonSet =
          moonSet.toString().substring(startIndex7 + start.length, endIndex7);

      final startIndex8 = lunarMidnight.toString().indexOf(start);
      final endIndex8 =
          lunarMidnight.toString().indexOf(end, startIndex8 + start.length);
      lunarMidnight = lunarMidnight
          .toString()
          .substring(startIndex8 + start.length, endIndex8);
    });
  }

  Item selectedUser;
  List<Item> users = <Item>[];

  void addCityStateToList() {
    setState(() {
      if (cityValue != null) {
        users.insert(
            0,
            Item(
                cityValue,
                Icon(
                  Icons.location_city,
                  color: const Color(0xFFFFCA28),
                )));
      }
    });
  }

  void all() {
    setState(() {
      this.getWeather();
    });
  }

  void changeBaground() {
    setState(() {
      if (description.toString() == "light rain" ||
          description.toString() == "rain" ||
          description.toString() == "shower rain" ||
          description.toString() == "mist" ||
          description.toString() == "moderate rain") {
        weatherBcgrnd = "Rainy";
        _rainIsVisible = true;
        _isVisible = false;
        _cloudIsVisible = false;
        _snowIsVisible = false;
        _thunderIsVisible = false;
      } else if (description.toString() == "thunderstorm") {
        weatherBcgrnd = "Thunder";
        _thunderIsVisible = true;
        _isVisible = false;
        _cloudIsVisible = false;
        _snowIsVisible = false;
        _rainIsVisible = false;
      } else if (description.toString() == "snow") {
        weatherBcgrnd = "Snowy";
        _snowIsVisible = true;
        _isVisible = false;
        _cloudIsVisible = false;
        _rainIsVisible = false;
        _thunderIsVisible = false;
      } else if (description.toString() == "broken clouds" ||
          description == "scattered clouds" ||
          description == "few clouds" ||
          description == "overcast clouds") {
        weatherBcgrnd = "Cloudy";
        _cloudIsVisible = true;
        _isVisible = false;
        _rainIsVisible = false;
        _snowIsVisible = false;
        _thunderIsVisible = false;
      } else {
        weatherBcgrnd = "Sunny";
        _cloudIsVisible = false;
        _isVisible = true;
        _rainIsVisible = false;
        _snowIsVisible = false;
        _thunderIsVisible = false;
      }
    });
  }

  void addInitialCityStateToList() {
    setState(() {
      users.insert(
        0,
        Item(
            'Parkersburg',
            Icon(
              Icons.location_city,
              color: const Color(0xFFFFCA28),
            )),
      );
    });
  }

  void changeToDirection() {
    setState(() {
      arr[0] = windDir1;
      arr[1] = windDir2;
      arr[2] = windDir3;
      arr[3] = windDir4;
      arr[4] = windDir5;
      arr[5] = windDirDay1;
      arr[6] = windDirDay2;
      arr[7] = windDirDay3;
      arr[8] = windDirDay4;
      arr[9] = windDirDay5;
      int i = 0;
      while (i < 10) {
        int g = int.parse(arr[i].toString());
        if (g < 0) {
          arr[i] = 'Loading';
          i++;
        } else if (g < 12 || g > 348) {
          arr[i] = 'N';
          i++;
        } else if (g > 11 && g < 89) {
          arr[i] = 'NE';
          i++;
        } else if (g > 88 && g < 102) {
          arr[i] = 'E';
          i++;
        } else if (g > 101 && g < 169) {
          arr[i] = 'SE';
          i++;
        } else if (g > 168 && g < 192) {
          arr[i] = 'S';
          i++;
        } else if (g > 191 && g < 259) {
          arr[i] = 'SW';
          i++;
        } else if (g > 258 && g < 282) {
          arr[i] = 'W';
          i++;
        } else if (g > 281 && g < 349) {
          arr[i] = 'NW';
          i++;
        }
      }
    });
  }

  String switchChange() {
    if (isSwitched == false) {
      units = 'imperial';
    } else {
      units = 'metric';
    }
    return units;
  }

  @override
  void initState() {
    super.initState();
    changeToDirection();
    switchChange();
    addInitialCityStateToList();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: <Widget>[
        Visibility(
          visible: _thunderIsVisible,
          child: WeatherWidget(
              size: Size.infinite,
              weather: 'Thunder',
              thunderConfig: ThunderConfig(thunderWidth: 12)),
        ),

        Visibility(
          visible: _isVisible,
          child: WeatherWidget(
              size: Size.infinite,
              weather: 'Sunny',
              sunConfig: SunConfig(
                  sunWidth: 360,
                  sunOutMill: 1500,
                  sunMidMill: 1500,
                  sunInColor: Colors.orange,
                  bottomColor: Colors.deepOrangeAccent[100],
                  topColor: Colors.yellow,
                  sunMidColor: Colors.yellow[400],
                  sunOutColor: Colors.orange[400],
                  sunBlurStyle: BlurStyle.solid,
                  sunBlurSigma: 13)),
        ),

        Visibility(
            visible: _cloudIsVisible,
            child: WeatherWidget(
                size: Size.infinite,
                weather: 'Cloudy',
                cloudConfig: CloudConfig(
                  topColor: Colors.blue[800],
                  cloudColor: Colors.white70,
                  showCloud: true,
                ))),

        Visibility(
            visible: _rainIsVisible,
            child: WeatherWidget(
                size: Size.infinite,
                weather: 'Rainy',
                rainConfig: RainConfig(
                  rainNum: 10,
                  rainCurve: Curves.easeInExpo,
                  rainColor: Color(0x9978909C),
                  topColor: Colors.blue[800],
                  rainRangeYEnd: 620,
                  durationRangeStartMill: 500,
                  durationRangeEndMill: 2500,
                  rainLength: 16,
                  rainWidth: 5,
                ))),

        Visibility(
          visible: _snowIsVisible,
          child: WeatherWidget(
              size: Size.infinite,
              weather: 'Snowy',
              snowConfig: SnowConfig(
                  snowSize: 20,
                  snowAreaXStart: 30,
                  snowAreaXEnd: 220,
                  snowWaveRangeMin: 20,
                  snowWaveRangeMax: 110,
                  snowFallSecMin: 10,
                  snowFallSecMax: 60,
                  snowWaveSecMin: 5,
                  snowWaveSecMax: 20,
                  snowAreaYStart: 200,
                  snowAreaYEnd: 620,
                  snowColor: Colors.white70,
                  fadeCurve: Curves.easeInCirc,
                  waveCurve: Curves.easeInOutSine)),
        ),

        //sunConfig: SunConfig()),
        Scaffold(
          drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              DrawerHeader(
                child: Text(
                  'Weather App',
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
                icon: Icon(Icons.add_circle),
                onPressed: () {
                  addCityStateToList();
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text("Success"),
                      content: Text(
                          "You have successfully added new city to the list!"),
                      actions: <Widget>[
                        FlatButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ]),
          ),
          appBar: AppBar(
            backgroundColor: Color(0xFFFFCA28).withOpacity(0.5),
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text('Weather App'),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (banner == null)
                  SizedBox(
                    height: 50,
                    child: Placeholder(),
                  )
                else
                  Container(
                    height: 50,
                    child: AdWidget(ad: banner),
                  ),
                DropdownButton<Item>(
                  hint: Text("Select item"),
                  value: selectedUser,
                  onChanged: (Item Value) {
                    setState(() {
                      selectedUser = Value;
                      this.all();
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
                Text('Switch F (Imperial) - C (Metric)'),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      switchChange();
                      getWeather();
                    });
                  },
                  activeTrackColor: Colors.yellow,
                  activeColor: Colors.orangeAccent,
                ),
                SizedBox(
                  height: 300,
                  child: Container(
                      child: Expanded(
                          child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.thermometerHalf),
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
                        ),
                        ListTile(
                          leading: FaIcon(FontAwesomeIcons.wind),
                          title: Text("Wind Direction"),
                          trailing: Text(
                              arr[0] != null ? arr[0].toString() : "Loading"),
                        )
                      ],
                    ),
                  ))),
                ),
                DefaultTabController(
                    length: 2, // length of tabs
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: 'Hourly'),
                                Tab(text: 'Daily'),
                              ],
                            ),
                          ),
                          Container(
                              height: 600, //height of TabBarView
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 200.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Container(
                                        width: 400.0,
                                        color: Colors.amber,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(formattedDt1 !=
                                                        null
                                                    ? formattedDt1.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(one != null
                                                    ? one.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(description1 !=
                                                        null
                                                    ? description1.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity1 != null
                                                    ? humidity1.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint1 != null
                                                    ? dewPoint1.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(cloudCoverage1 !=
                                                        null
                                                    ? cloudCoverage1.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(
                                                    visibility1 != null
                                                        ? visibility1.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(
                                                    windSpeed1 != null
                                                        ? windSpeed1.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[0] != null
                                                    ? arr[0].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.white,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(formattedDt2 !=
                                                        null
                                                    ? formattedDt2.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(two != null
                                                    ? two.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(description2 !=
                                                        null
                                                    ? description2.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity2 != null
                                                    ? humidity2.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint2 != null
                                                    ? dewPoint2.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(cloudCoverage2 !=
                                                        null
                                                    ? cloudCoverage2.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(
                                                    visibility2 != null
                                                        ? visibility2.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(
                                                    windSpeed2 != null
                                                        ? windSpeed2.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[1] != null
                                                    ? arr[1].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.amber,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(formattedDt3 !=
                                                        null
                                                    ? formattedDt3.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(three != null
                                                    ? three.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(description3 !=
                                                        null
                                                    ? description3.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity3 != null
                                                    ? humidity3.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint3 != null
                                                    ? dewPoint3.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(cloudCoverage3 !=
                                                        null
                                                    ? cloudCoverage3.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(
                                                    visibility3 != null
                                                        ? visibility3.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(
                                                    windSpeed3 != null
                                                        ? windSpeed3.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[2] != null
                                                    ? arr[2].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.white,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(formattedDt4 !=
                                                        null
                                                    ? formattedDt4.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(four != null
                                                    ? four.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(description4 !=
                                                        null
                                                    ? description4.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity4 != null
                                                    ? humidity4.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint4 != null
                                                    ? dewPoint4.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(cloudCoverage4 !=
                                                        null
                                                    ? cloudCoverage4.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(
                                                    visibility4 != null
                                                        ? visibility4.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(
                                                    windSpeed4 != null
                                                        ? windSpeed4.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[3] != null
                                                    ? arr[3].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.amber,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(formattedDt5 !=
                                                        null
                                                    ? formattedDt5.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(five != null
                                                    ? five.toString() + "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(description5 !=
                                                        null
                                                    ? description5.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity5 != null
                                                    ? humidity5.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint5 != null
                                                    ? dewPoint5.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(cloudCoverage5 !=
                                                        null
                                                    ? cloudCoverage5.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(
                                                    visibility5 != null
                                                        ? visibility5.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(
                                                    windSpeed5 != null
                                                        ? windSpeed5.toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[4] != null
                                                    ? arr[4].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 200.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Container(
                                        width: 400.0,
                                        color: Colors.amber,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(
                                                    formattedDt1Day != null
                                                        ? formattedDt1Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(oneDay != null
                                                    ? oneDay.toString() +
                                                        "\u00B0" +
                                                        "/" +
                                                        oneDaym.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(
                                                    description1Day != null
                                                        ? description1Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity1Day !=
                                                        null
                                                    ? humidity1Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint1Day !=
                                                        null
                                                    ? dewPoint1Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(
                                                    cloudCoverage1Day != null
                                                        ? cloudCoverage1Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(visibility1Day !=
                                                        null
                                                    ? visibility1Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(windSpeed1Day !=
                                                        null
                                                    ? windSpeed1Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[5] != null
                                                    ? arr[5].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.white,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(
                                                    formattedDt2Day != null
                                                        ? formattedDt2Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(twoDay != null
                                                    ? twoDay.toString() +
                                                        "\u00B0" +
                                                        "/" +
                                                        twoDaym.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(
                                                    description2Day != null
                                                        ? description2Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity2Day !=
                                                        null
                                                    ? humidity2Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint2Day !=
                                                        null
                                                    ? dewPoint2Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(
                                                    cloudCoverage2Day != null
                                                        ? cloudCoverage2Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(visibility2Day !=
                                                        null
                                                    ? visibility2Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(windSpeed2Day !=
                                                        null
                                                    ? windSpeed2Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[6] != null
                                                    ? arr[6].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.amber,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(
                                                    formattedDt3Day != null
                                                        ? formattedDt3Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(threeDay != null
                                                    ? threeDay.toString() +
                                                        "\u00B0" +
                                                        "/" +
                                                        threeDay.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(
                                                    description3Day != null
                                                        ? description3Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity3Day !=
                                                        null
                                                    ? humidity3Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint3Day !=
                                                        null
                                                    ? dewPoint3Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(
                                                    cloudCoverage3Day != null
                                                        ? cloudCoverage3Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(visibility3Day !=
                                                        null
                                                    ? visibility3Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(windSpeed3Day !=
                                                        null
                                                    ? windSpeed3Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[7] != null
                                                    ? arr[7].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.white,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(
                                                    formattedDt4Day != null
                                                        ? formattedDt4Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(fourDay != null
                                                    ? fourDay.toString() +
                                                        "\u00B0" +
                                                        "/" +
                                                        fourDaym.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(
                                                    description4Day != null
                                                        ? description4Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity4Day !=
                                                        null
                                                    ? humidity4Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint4Day !=
                                                        null
                                                    ? dewPoint4Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(
                                                    cloudCoverage4Day != null
                                                        ? cloudCoverage4Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(visibility4Day !=
                                                        null
                                                    ? visibility4Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(windSpeed4Day !=
                                                        null
                                                    ? windSpeed4Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[8] != null
                                                    ? arr[8].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                      Container(
                                        width: 400.0,
                                        color: Colors.amber,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.clock),
                                                title: Text("Time:"),
                                                trailing: Text(
                                                    formattedDt5Day != null
                                                        ? formattedDt5Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(FontAwesomeIcons
                                                    .thermometerHalf),
                                                title: Text("Temp:"),
                                                trailing: Text(fiveDay != null
                                                    ? fiveDay.toString() +
                                                        "\u00B0" +
                                                        "/" +
                                                        fiveDaym.toString() +
                                                        "\u00B0"
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.info),
                                                title: Text("Description:"),
                                                trailing: Text(
                                                    description5Day != null
                                                        ? description5Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Humidity"),
                                                trailing: Text(humidity5Day !=
                                                        null
                                                    ? humidity5Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudRain),
                                                title: Text("Dew Point:"),
                                                trailing: Text(dewPoint5Day !=
                                                        null
                                                    ? dewPoint5Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Cloud coverage:"),
                                                trailing: Text(
                                                    cloudCoverage5Day != null
                                                        ? cloudCoverage5Day
                                                            .toString()
                                                        : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.lowVision),
                                                title: Text("Visibility:"),
                                                trailing: Text(visibility5Day !=
                                                        null
                                                    ? visibility5Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind speed:"),
                                                trailing: Text(windSpeed5Day !=
                                                        null
                                                    ? windSpeed5Day.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.wind),
                                                title: Text("Wind direction:"),
                                                trailing: Text(arr[9] != null
                                                    ? arr[9].toString()
                                                    : "Loading"),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                    ],
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
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: 'Sun'),
                                Tab(text: 'Moon'),
                              ],
                            ),
                          ),
                          Container(
                              height: 500, //height of TabBarView
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 500.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Container(
                                        width: 400.0,
                                        color: Colors.amber,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Sunrise:"),
                                                trailing: Text(sunrise != null
                                                    ? sunrise.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title: Text("Sunset:"),
                                                trailing: Text(sunset != null
                                                    ? sunset.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.solidSun),
                                                title: Text("Solar noon:"),
                                                trailing: Text(solarNoon != null
                                                    ? solarNoon.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.solidSun),
                                                title: Text("Solar midnight"),
                                                trailing: Text(solarMidnight !=
                                                        null
                                                    ? solarMidnight.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.sun),
                                                title:
                                                    Text("Hours of Daylight:"),
                                                trailing: Text(hrOfDay != null
                                                    ? hrOfDay.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.cloudSun),
                                                title: Text("Hours of Dark:"),
                                                trailing: Text(hrOfDark != null
                                                    ? hrOfDark.toString()
                                                    : "Loading"),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  height: 500.0,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      Container(
                                        width: 400.0,
                                        color: Colors.blueGrey,
                                        child: Expanded(
                                            child: Padding(
                                          padding: EdgeInsets.all(20.0),
                                          child: ListView(
                                            children: <Widget>[
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.moon),
                                                title: Text("Moon phase:"),
                                                trailing: Text(moonPhase != null
                                                    ? moonPhase.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.moon),
                                                title: Text("Moon rise:"),
                                                trailing: Text(moonRise != null
                                                    ? moonRise.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.solidMoon),
                                                title: Text("Lunar noon:"),
                                                trailing: Text(lunarNoon != null
                                                    ? lunarNoon.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.moon),
                                                title: Text("Moon set:"),
                                                trailing: Text(moonSet != null
                                                    ? moonSet.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.solidMoon),
                                                title: Text("Lunar midnight:"),
                                                trailing: Text(lunarMidnight !=
                                                        null
                                                    ? lunarMidnight.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.solidMoon),
                                                title: Text("Next full moon:"),
                                                trailing: Text(nextFull != null
                                                    ? nextFull.toString()
                                                    : "Loading"),
                                              ),
                                              ListTile(
                                                leading: FaIcon(
                                                    FontAwesomeIcons.moon),
                                                title: Text("Next new moon:"),
                                                trailing: Text(nextNew != null
                                                    ? nextNew.toString()
                                                    : "Loading"),
                                              ),
                                            ],
                                          ),
                                        )),
                                      ),
                                    ],
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
                          Text(
                            "Temperature",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black38,
                            ),
                          ),
                          Container(
                            child: TabBar(
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: 'Next 5 Hours'),
                                Tab(text: 'Next 5 Days'),
                              ],
                            ),
                          ),
                          Container(
                              height: 500, //height of TabBarView
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  color: Colors.amber,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: BezierChart(
                                    bezierChartScale: BezierChartScale.CUSTOM,
                                    xAxisCustomValues: [1, 2, 3, 4, 5],
                                    series: [
                                      BezierLine(
                                        data: [
                                          DataPoint<double>(
                                              value: chartDay1Double, xAxis: 1),
                                          DataPoint<double>(
                                              value: chartDay2Double, xAxis: 2),
                                          DataPoint<double>(
                                              value: chartDay3Double, xAxis: 3),
                                          DataPoint<double>(
                                              value: chartDay4Double, xAxis: 4),
                                          DataPoint<double>(
                                              value: chartDay5Double, xAxis: 5),
                                        ],
                                      ),
                                    ],
                                    config: BezierChartConfig(
                                      verticalIndicatorStrokeWidth: 3.0,
                                      verticalIndicatorColor: Colors.black26,
                                      showVerticalIndicator: true,
                                      backgroundColor: Colors.amber,
                                      snap: false,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.amber,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: BezierChart(
                                    bezierChartScale: BezierChartScale.CUSTOM,
                                    xAxisCustomValues: [1, 2, 3, 4, 5],
                                    series: [
                                      BezierLine(
                                        data: [
                                          DataPoint<double>(
                                              value: chartH1Double, xAxis: 1),
                                          DataPoint<double>(
                                              value: chartH2Double, xAxis: 2),
                                          DataPoint<double>(
                                              value: chartH3Double, xAxis: 3),
                                          DataPoint<double>(
                                              value: chartH4Double, xAxis: 4),
                                          DataPoint<double>(
                                              value: chartDay5Double, xAxis: 5),
                                        ],
                                      ),
                                    ],
                                    config: BezierChartConfig(
                                      verticalIndicatorStrokeWidth: 3.0,
                                      verticalIndicatorColor: Colors.black26,
                                      showVerticalIndicator: true,
                                      backgroundColor: Colors.amber,
                                      snap: false,
                                    ),
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
                          Text(
                            "Wind Speed",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black38,
                            ),
                          ),
                          Container(
                            child: TabBar(
                              labelColor: Colors.amber,
                              unselectedLabelColor: Colors.black,
                              tabs: [
                                Tab(text: 'Next 5 Hours'),
                                Tab(text: 'Next 5 Days'),
                              ],
                            ),
                          ),
                          Container(
                              height: 500, //height of TabBarView
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.5))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  color: Colors.amber,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: BezierChart(
                                    bezierChartScale: BezierChartScale.CUSTOM,
                                    xAxisCustomValues: [1, 2, 3, 4, 5],
                                    series: [
                                      BezierLine(
                                        data: [
                                          DataPoint<double>(
                                              value: chartDay11Double,
                                              xAxis: 1),
                                          DataPoint<double>(
                                              value: chartDay12Double,
                                              xAxis: 2),
                                          DataPoint<double>(
                                              value: chartDay13Double,
                                              xAxis: 3),
                                          DataPoint<double>(
                                              value: chartDay14Double,
                                              xAxis: 4),
                                          DataPoint<double>(
                                              value: chartDay15Double,
                                              xAxis: 5),
                                        ],
                                      ),
                                    ],
                                    config: BezierChartConfig(
                                      verticalIndicatorStrokeWidth: 3.0,
                                      verticalIndicatorColor: Colors.black26,
                                      showVerticalIndicator: true,
                                      backgroundColor: Colors.amber,
                                      snap: false,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: Colors.amber,
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: BezierChart(
                                    bezierChartScale: BezierChartScale.CUSTOM,
                                    xAxisCustomValues: [1, 2, 3, 4, 5],
                                    series: [
                                      BezierLine(
                                        data: [
                                          DataPoint<double>(
                                              value: chartH11Double, xAxis: 1),
                                          DataPoint<double>(
                                              value: chartH12Double, xAxis: 2),
                                          DataPoint<double>(
                                              value: chartH13Double, xAxis: 3),
                                          DataPoint<double>(
                                              value: chartH14Double, xAxis: 4),
                                          DataPoint<double>(
                                              value: chartDay15Double,
                                              xAxis: 5),
                                        ],
                                      ),
                                    ],
                                    config: BezierChartConfig(
                                      verticalIndicatorStrokeWidth: 3.0,
                                      verticalIndicatorColor: Colors.black26,
                                      showVerticalIndicator: true,
                                      backgroundColor: Colors.amber,
                                      snap: false,
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
      ]),
    );
  }
}

class Item {
  const Item(this.name, this.icon);
  final String name;
  final Icon icon;
}
