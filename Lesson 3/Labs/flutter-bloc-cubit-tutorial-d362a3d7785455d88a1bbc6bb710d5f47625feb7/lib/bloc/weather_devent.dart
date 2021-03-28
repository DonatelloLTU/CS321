part of 'weather_bloc.dart';

import 'package:flutter/cupertino.dart';

@immutable
abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final String cityName;

  GetWeather(this.cityName);
}
