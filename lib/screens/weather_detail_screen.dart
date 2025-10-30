import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/constants/text_styles.dart';
import '/extensions/datetime.dart';
import '/extensions/strings.dart';
import '/providers/get_city_forecast_provider.dart';
import '/screens/weather_screen/weather_info.dart';
import '/views/gradient_container.dart';

class WeatherDetailScreen extends ConsumerWidget {
  const WeatherDetailScreen({
    super.key,
    required this.cityName,
  });

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(cityForecastProvider(cityName));

    return Scaffold(
      body: weatherData.when(
        data: (weather) {
          return GradientContainer(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // City name
                Text(
                  weather.name,
                  style: TextStyles.h1,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 20),

                // Current date
                Text(
                  DateTime.now().dateTime,
                  style: TextStyles.subtitleText,
                ),

                const SizedBox(height: 30),

                // Weather icon
                Image.asset(
                  'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                  height: 260,
                  fit: BoxFit.contain,
                ),

                const SizedBox(height: 30),

                // Weather description
                Text(
                  weather.weather[0].description.capitalize,
                  style: TextStyles.h2,
                ),

                const SizedBox(height: 40),

                // Weather info
                WeatherInfo(weather: weather),

                const SizedBox(height: 30),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text(
              'Failed to load weather data',
              style: TextStyle(color: Colors.white),
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
