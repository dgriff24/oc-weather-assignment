import '../model/weather_data.dart';

class FakeData {
  Future<WeatherData> getWeather() => Future.value(WeatherData(
        humidity: 99,
        lastUpdated: DateTime.now(),
        loadedSuccessfully: true,
        temperatureUnit: TemperatureUnit.fahrenheit,
        windDirection: 90,
        windSpeed: 98,
        feelsLikeTemperature: 97,
        temperature: 96,
      ));
}
