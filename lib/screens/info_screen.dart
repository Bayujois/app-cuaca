import 'package:flutter/material.dart';

import '/constants/app_colors.dart';
import '/constants/text_styles.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              Text('Info Aplikasi', style: TextStyles.h1),
              SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.date_range, color: Colors.white),
                title: Text('Tanggal Pembuatan', style: TextStyles.h3),
                subtitle: Text('10 juli 2025',
                    style: TextStyle(color: Colors.white70)),
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.verified, color: Colors.white),
                title: Text('Versi Aplikasi', style: TextStyles.h3),
                subtitle:
                    Text('1.0.0', style: TextStyle(color: Colors.white70)),
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('Developer', style: TextStyles.h3),
                subtitle:
                    Text('Bayu Jois', style: TextStyle(color: Colors.white70)),
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.email, color: Colors.white),
                title: Text('Kontak', style: TextStyles.h3),
                subtitle: Text('ybay33095@gmail.com',
                    style: TextStyle(color: Colors.white70)),
              ),
              Divider(color: Colors.white24),
              ListTile(
                leading: Icon(Icons.info_outline, color: Colors.white),
                title: Text('Tentang Aplikasi', style: TextStyles.h3),
                subtitle: Text(
                  'Aplikasi cuaca ini dibuat untuk keperluan pembelajaran dan tugas akhir semester mata kuliah Pemrograman Mobile.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
