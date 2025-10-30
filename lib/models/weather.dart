import 'package:flutter/foundation.dart';

@immutable
class Weather {
  final Coord coord;
  final List<WeatherData> weather;
  final String base;
  final Main main;
  final int? visibility;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  const Weather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        coord: Coord.fromJson(json['coord']),
        weather: (json['weather'] as List<dynamic>)
            .map((e) => WeatherData.fromJson(e))
            .toList(),
        base: json['base'],
        main: Main.fromJson(json['main']),
        visibility: json['visibility'],
        wind: Wind.fromJson(json['wind']),
        rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
        clouds: Clouds.fromJson(json['clouds']),
        dt: json['dt'],
        sys: Sys.fromJson(json['sys']),
        timezone: json['timezone'],
        id: json['id'],
        name: json['name'],
        cod: json['cod'],
      );
}

@immutable
class Coord {
  final double lon;
  final double lat;

  const Coord({required this.lon, required this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'].toDouble(),
        lat: json['lat'].toDouble(),
      );
}

@immutable
class WeatherData {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherData({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
}

@immutable
class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;
  final int? visibility;

  const Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
    this.visibility,
  });

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json['temp'].toDouble(),
        feelsLike: json['feels_like'].toDouble(),
        tempMin: json['temp_min'].toDouble(),
        tempMax: json['temp_max'].toDouble(),
        pressure: json['pressure'],
        humidity: json['humidity'],
        seaLevel: json['sea_level'],
        grndLevel: json['grnd_level'],
        visibility: json['visibility'],
      );
}

@immutable
class Wind {
  final double speed;
  final int deg;
  final double? gust;

  const Wind({
    required this.speed,
    required this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: (json['speed'] ?? 0).toDouble(),
        deg: json['deg'] ?? 0,
        gust: json['gust']?.toDouble(),
      );
}

@immutable
class Rain {
  final double? oneHour;

  const Rain({this.oneHour});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(oneHour: json['1h']?.toDouble() ?? 0.0);
  }
}

@immutable
class Clouds {
  final int all;

  const Clouds({required this.all});

  factory Clouds.fromJson(Map<String, dynamic> json) =>
      Clouds(all: json['all']);
}

@immutable
class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json['type'] ?? 0,
        id: json['id'] ?? 0,
        country: json['country'] ?? '',
        sunrise: json['sunrise'] ?? 0,
        sunset: json['sunset'] ?? 0,
      );
}
