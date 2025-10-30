// Tahap 1: Provider & SharedPreferences
// File: lib/providers/settings_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsState {
  final bool isCelsius;
  final bool isKmPerHour;
  final bool isAutoTimezone;
  final String language;
  final String themeMode;

  const SettingsState({
    required this.isCelsius,
    required this.isKmPerHour,
    required this.isAutoTimezone,
    required this.language,
    required this.themeMode,
  });

  SettingsState copyWith({
    bool? isCelsius,
    bool? isKmPerHour,
    bool? isAutoTimezone,
    String? language,
    String? themeMode,
  }) {
    return SettingsState(
      isCelsius: isCelsius ?? this.isCelsius,
      isKmPerHour: isKmPerHour ?? this.isKmPerHour,
      isAutoTimezone: isAutoTimezone ?? this.isAutoTimezone,
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

class SettingsNotifier extends StateNotifier<SettingsState> {
  SettingsNotifier()
      : super(const SettingsState(
          isCelsius: true,
          isKmPerHour: true,
          isAutoTimezone: true,
          language: 'id',
          themeMode: 'default',
        )) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    state = SettingsState(
      isCelsius: prefs.getBool('isCelsius') ?? true,
      isKmPerHour: prefs.getBool('isKmPerHour') ?? true,
      isAutoTimezone: prefs.getBool('isAutoTimezone') ?? true,
      language: prefs.getString('language') ?? 'id',
      themeMode: prefs.getString('themeMode') ?? 'default',
    );
  }

  Future<void> updateSetting(SettingsState newState) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isCelsius', newState.isCelsius);
    await prefs.setBool('isKmPerHour', newState.isKmPerHour);
    await prefs.setBool('isAutoTimezone', newState.isAutoTimezone);
    await prefs.setString('language', newState.language);
    await prefs.setString('themeMode', newState.themeMode);

    state = newState;
  }

  void toggleCelsius(bool value) {
    updateSetting(state.copyWith(isCelsius: value));
  }

  void toggleKmPerHour(bool value) {
    updateSetting(state.copyWith(isKmPerHour: value));
  }

  void toggleAutoTimezone(bool value) {
    updateSetting(state.copyWith(isAutoTimezone: value));
  }

  void changeLanguage(String lang) {
    updateSetting(state.copyWith(language: lang));
  }

  void changeTheme(String mode) {
    updateSetting(state.copyWith(themeMode: mode));
  }
}

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, SettingsState>((ref) {
  return SettingsNotifier();
});
