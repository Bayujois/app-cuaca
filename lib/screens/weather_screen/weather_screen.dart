import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';
import '/extensions/datetime.dart';
import '/extensions/strings.dart';
import '/providers/get_current_weather_provider.dart';
import '/views/hourly_forecast_view.dart';
import 'weather_info.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(currentWeatherProvider);

    return weatherData.when(
      data: (weather) {
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryBlue, AppColors.secondaryBlack],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: double.infinity),

                            // Nama Kota
                            Text(
                              weather.name,
                              style: TextStyles.h1,
                            ),

                            const SizedBox(height: 20),

                            // Tanggal
                            Text(
                              DateTime.now().dateTime,
                              style: TextStyles.subtitleText,
                            ),

                            const SizedBox(height: 30),

                            // Ikon Cuaca
                            SizedBox(
                              height: 260,
                              child: Image.asset(
                                'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                                fit: BoxFit.contain,
                              ),
                            ),

                            const SizedBox(height: 30),

                            // Deskripsi Cuaca
                            Text(
                              weather.weather[0].description.capitalize,
                              style: TextStyles.h2,
                            ),

                            const SizedBox(height: 40),

                            // Info Tambahan
                            WeatherInfo(weather: weather),

                            const SizedBox(height: 40),

                            // Judul Perkiraan Hari Ini
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hari Ini',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.white,
                                  ),
                                ),
                                InkWell(
                                  child: Text(
                                    'Lihat laporan lengkap',
                                    style:
                                        TextStyle(color: AppColors.lightBlue),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 15),

                            // Prakiraan per jam
                            const HourlyForecastView(),

                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text('Terjadi kesalahan'),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
