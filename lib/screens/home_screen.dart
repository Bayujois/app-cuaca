import 'package:flutter/material.dart';

import '/constants/app_colors.dart';
import '/screens/forecast_report_screen.dart';
import '/screens/search_screen.dart';
import '/screens/info_screen.dart'; // <--- Layar Info Aplikasi
import 'weather_screen/weather_screen.dart';
import '/services/api_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _halamanAktif = 0;

  final _layar = const [
    WeatherScreen(), // Cuaca Saat Ini
    SearchScreen(), // Cari Lokasi
    ForecastReportScreen(), // Prakiraan Cuaca
    AppInfoScreen(), // Info Aplikasi
  ];

  @override
  void initState() {
    ApiHelper.getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layar[_halamanAktif],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: AppColors.secondaryBlack,
        ),
        child: NavigationBar(
          selectedIndex: _halamanAktif,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) =>
              setState(() => _halamanAktif = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.home, color: Colors.white),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.search, color: Colors.white),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.wb_sunny_outlined, color: Colors.white),
              selectedIcon: Icon(Icons.wb_sunny, color: Colors.white),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.info_outline, color: Colors.white),
              selectedIcon: Icon(Icons.info, color: Colors.white),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
