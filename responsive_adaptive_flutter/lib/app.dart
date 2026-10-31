import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

class ResponsiveAdaptiveApp extends StatelessWidget {
  const ResponsiveAdaptiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF536DFE);

    return MaterialApp(
      title: 'Responsive & Adaptive UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seedColor),
        scaffoldBackgroundColor: const Color(0xFFF6F7FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F7FB),
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
