import 'package:flutter/material.dart';

import 'pages/landing_page.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/input_buku_page.dart';
import 'pages/riwayat_page.dart';
import 'pages/about_page.dart';

void main() {
  runApp(const PeminjamanBukuApp());
}

class PeminjamanBukuApp extends StatelessWidget {
  const PeminjamanBukuApp({super.key});

  @override
  Widget build(BuildContext context) {
    const Color pinkSoft = Color(0xFFFFC1E3);

    return MaterialApp(
      title: 'Peminjaman Buku Perpustakaan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: pinkSoft,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: pinkSoft,
          elevation: 0,
          foregroundColor: Colors.black87,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: pinkSoft),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: pinkSoft,
            foregroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/riwayat': (context) => const RiwayatPage(),
        '/input': (context) => const InputBukuPage(),
        '/about': (context) => const AboutPage(),
      },
    );
  }
}
