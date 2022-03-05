import '../model/weather_data.dart';

class FakeData {
  Future<WeatherData> getWeather() => Future.value(WeatherData(
        humidity: 79,
        lastUpdated: DateTime.now(),
        loadedSuccessfully: true,
        temperatureUnit: TemperatureUnit.fahrenheit,
        windDirection: 90,
        windSpeed: 15,
        feelsLikeTemperature: 13,
        temperature: 27,
      ));
}
