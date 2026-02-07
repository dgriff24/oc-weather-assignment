import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weather.dart';

class Weatherlink {
  final httpClient = http.Client();

  Future<Weather> getWeather() async {
    final response = await httpClient.get(
      Uri.parse('<endpoint>'),
    );
    
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return Weather.fromWeatherlink(data);
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}
