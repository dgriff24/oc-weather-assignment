import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather.dart';

class Weatherlink {
  final httpClient = http.Client();

  Future<Weather> getWeather() async {
    final httpPayload = <String, dynamic>{};
    return Weather.fromWeatherlink(httpPayload);
  }
}
