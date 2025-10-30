import 'package:flutter/material.dart';

import '/constants/text_styles.dart';
import '/extensions/double.dart';
import '/models/weather.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    super.key,
    required this.weather,
  });

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            WeatherInfoTile(
              title: 'Temperatur',
              value: '${weather.main.temp}°',
            ),
            const SizedBox(width: 20),
            WeatherInfoTile(
              title: 'Angin',
              value: '${weather.wind.speed.kmh} km/h',
            ),
            const SizedBox(width: 20),
            WeatherInfoTile(
              title: 'Kelembapan',
              value: '${weather.main.humidity}%',
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherInfoTile extends StatelessWidget {
  const WeatherInfoTile({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyles.subtitleText,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: TextStyles.h3,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
