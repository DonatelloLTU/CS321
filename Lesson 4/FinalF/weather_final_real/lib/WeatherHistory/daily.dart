import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_final_real/main.dart';

HomeState homeState = HomeState();

class Daily {
  var lat = homeState.sendLat();
  var lon = homeState.sendLon();
  var one;
  var two;
  var three;
  var four;
  var five;

  Future getWeather() async {
    http.Response response = await http.get(
        "https://api.openweathermap.org/data/2.5/onecall?lat=" +
            lat +
            "&lon=" +
            lon +
            "&exclude=current,minutely,daily,alerts&appid=f3594c0189b761d6bb32d738b3cbccf8");
    var results = jsonDecode(response.body);

    one = results['timezone_offset'];
    two = results['hourly'][1]['temp'];
    three = results['hourly'][2]['temp'];
    four = results['hourly'][3]['temp'];
    five = results['hourly'][4]['temp'];
  }

  String daily() {
    return one;
  }

  String daily1() {
    return two;
  }

  String daily2() {
    return three;
  }

  String daily3() {
    return four;
  }

  String daily4() {
    return five;
  }
}
