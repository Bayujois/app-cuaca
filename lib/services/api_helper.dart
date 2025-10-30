import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show immutable;

import '/constants/constants.dart';
import '/models/hourly_weather.dart';
import '/models/weather.dart';
import '/models/weekly_weather.dart';
import '/utils/logging.dart';

@immutable
class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?current=&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto';

  static final dio = Dio();

  //* Current Weather (pakai Jakarta)
  static Future<Weather> getCurrentWeather() async {
    final url =
        '$baseUrl/weather?q=Jakarta&units=metric&appid=${Constants.apiKey}';

    printSuccess('Calling URL: $url');
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  //* Hourly Weather (pakai lat/lon Jakarta)
  static Future<HourlyWeather> getHourlyForecast() async {
    final url =
        '$baseUrl/forecast?lat=-6.2&lon=106.8&units=metric&appid=${Constants.apiKey}';

    printSuccess('Calling URL: $url');
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  //* Weekly weather (pakai Open-Meteo dan lat/lon Jakarta)
  static Future<WeeklyWeather> getWeeklyForecast() async {
    final url = '$weeklyWeatherUrl&latitude=-6.2&longitude=106.8';

    printSuccess('Calling URL: $url');
    final response = await _fetchData(url);
    return WeeklyWeather.fromJson(response);
  }

  //* Weather by City Name
  static Future<Weather> getWeatherByCityName({
    required String cityName,
  }) async {
    final url =
        '$baseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

    printSuccess('Calling URL: $url');
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  //* Fetch Data for a url
  static Future<Map<String, dynamic>> _fetchData(String url) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        printWarning('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      printWarning('Error fetching data from $url: $e');
      throw Exception('Error fetching data');
    }
  }
}
