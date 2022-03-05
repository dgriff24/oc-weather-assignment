class WeatherData {
  late int windSpeed;
  late double windDirection;
  TemperatureUnit temperatureUnit;
  late int humidity;
  DateTime lastUpdated;
  late bool loadedSuccessfully;
  late int temperature;
  late int feelsLikeTemperature;

  WeatherData({
    required this.windSpeed,
    required this.windDirection,
    required this.temperatureUnit,
    required this.humidity,
    required this.lastUpdated,
    required this.loadedSuccessfully,
    required this.temperature,
    required this.feelsLikeTemperature,
  });

  WeatherData.fromWeatherlink(Map<String, dynamic> data)
      : temperatureUnit = TemperatureUnit.fahrenheit,
        lastUpdated = DateTime.now() {
    loadedSuccessfully = false;
    final sensors = data['sensors'];

    final temperatureSensor =
        sensors.firstWhere((sensor) => sensor['lsid'] == 415802);
    final weatherData = temperatureSensor['data'][0];

    windSpeed = weatherData['wind_speed_avg_last_10_min'].round();
    windDirection = weatherData['wind_dir_scalar_avg_last_10_min'].toDouble();
    feelsLikeTemperature = weatherData['thsw_index'].round();
    humidity = 99; // TODO update to use weatherData
    temperature = 99; // TODO update to use weatherData


    loadedSuccessfully = true;
  }
}

enum TemperatureUnit {
  fahrenheit,
  celsius,
  kelvin,
}
