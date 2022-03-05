import 'dart:convert';

// import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../model/weather_data.dart';

class WeatherlinkData {
  static const _apiKey = '<API Key v2:>';
  static const _secret = '<API Secret:>';

  static const _stationId = '112912';

  static const endPointUrl =
      'https://api.weatherlink.com/v2/current/$_stationId';
  final httpClient = http.Client();

  Future<WeatherData> getWeather() async {
    final requestUrl = '<add request url>';

    print(requestUrl);

    final response = await httpClient.get(Uri.parse(requestUrl));

    return WeatherData.fromWeatherlink(jsonDecode(response.body));
  }

}
