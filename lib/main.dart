import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';

import '/providers/setting_provider.dart';
import '/screens/home_screen.dart';
import '/theme/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Jiffy.setLocale('id');
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Cuaca',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: () {
        switch (settings.themeMode) {
          case 'Dark':
            return ThemeMode.dark;
          case 'Light':
            return ThemeMode.light;
          default:
            return ThemeMode.system;
        }
      }(),
      locale: const Locale('id'),
      supportedLocales: const [
        Locale('id'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomeScreen(),
    );
  }
}
