import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../view_models/weather_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _defaultSpacer = SizedBox(height: 12);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WeatherViewModel>(
      create: (_) => WeatherViewModel(),
        builder: (_, __) => Consumer<WeatherViewModel>(
        builder: (context, weather, _) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: weather.refresh,
            child: const Icon(MdiIcons.refresh),
          ),
          body: weather.isLoading ? _loading() : _loadedBody(weather),
        ),
      ),
    );
  }

  Widget _temperatureWidget(WeatherViewModel weather) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(weather.currentTemp.toString(),
                style: const TextStyle(fontSize: 120)),
            const Padding(
              padding: EdgeInsets.only(top: 14.0, left: 8.0),
              child: Text('°F', style: TextStyle(fontSize: 50)),
            ),
          ],
        ),
        Text(
          'Feels like: ${weather.feelsLike}°',
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }

  Widget _weatherSymbol(WeatherViewModel weather) {
    return Icon(weather.icon, size: 200);
  }

  String _formatLastUpdated(DateTime lastUpdated) {
    return DateFormat.jm().format(lastUpdated);
  }

  Widget _windWidget(WeatherViewModel weather) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(MdiIcons.weatherWindy, size: 30),
            Text(
              weather.windDirection,
              style: TextStyle(
                  fontSize: weather.windDirection.length == 1 ? 30 : 20),
            ),
          ],
        ),
        Text(
          '${weather.windSpeed} mph',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  Widget _humidityWidget(WeatherViewModel weather) {
    return Row(
      children: [
        const Icon(MdiIcons.waterOutline, size: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Hum', style: TextStyle(fontSize: 18)),
            Text('${weather.humidity}%', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ],
    );
  }


  Widget _loading() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Text('Loading...'),
        ],
      ),
    );
  }

  Widget _loadedBody(WeatherViewModel weather) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 12,
            right: 0,
            height: 75,
            child: Image.asset('assets/oc_logo.png'),
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              _weatherSymbol(weather),
              const Spacer(flex: 1),
              _temperatureWidget(weather),
              const Spacer(flex: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _windWidget(weather),
                  _humidityWidget(weather),
                ],
              ),
              const Spacer(flex: 3),
              Text(
                  'Last Refreshed: ${_formatLastUpdated(weather.lastUpdated)}'),
              _defaultSpacer,
            ],
          ),
        ],
      ),
    );
  }
}
