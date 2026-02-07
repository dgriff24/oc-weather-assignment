import 'package:flutter/material.dart';

import '../model/weather.dart';
import '../services/weatherlink.dart';

class WeatherViewModel extends ChangeNotifier {
  late Weather _weatherData;
  final _weatherlinkData = Weatherlink();

  bool isLoading = true;

  IconData get icon {
    return Icons.wb_sunny_outlined;
  }

  int get currentTemp {
    return _weatherData.temperature;
  }

  int get feelsLike {
    return _weatherData.feelsLikeTemperature;
  }

  String get windDirection {
    final dir = _weatherData.windDirection;
    // TODO add logic to convert the direction to N, NNE, NE, ENE, E, ESE, SE, SSE, S, SSW, SW, WSW, W, WNW, NW, NNW
    return 'E';
  }

  int get windSpeed {
    return _weatherData.windSpeed;
  }

  int get humidity {
    return _weatherData.humidity;
  }

  DateTime get lastUpdated {
    return _weatherData.lastUpdated;
  }

  WeatherViewModel() {
    refresh();
  }

  Future<void> refresh() async {
    isLoading = true;
    notifyListeners();

    final weatherFuture = _weatherlinkData.getWeather();
    final timingFuture = Future.delayed(const Duration(milliseconds: 800));
    _weatherData = await weatherFuture;

    // for visualization purposes
    await timingFuture;

    isLoading = false;
    notifyListeners();
  }
}
