import 'package:flutter/material.dart';

import '../model/weather_data.dart';
import '../services/fake_data.dart';

class WeatherViewModel extends ChangeNotifier {
  late WeatherData _weatherData;

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
    return 'N';
  }

  int get windSpeed {
    return _weatherData.windSpeed;
  }

  int get humidity {
    return _weatherData.humidity.round();
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

    _weatherData = await FakeData().getWeather();

    isLoading = false;
    notifyListeners();
  }
}
