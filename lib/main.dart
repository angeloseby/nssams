import 'package:flutter/material.dart';
import 'package:nssams/screens/login_page.dart';
import 'package:nssams/utils/custom_color_scheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSSAMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: CustomColorScheme.mainColor,
        ),
        scaffoldBackgroundColor: const Color(0xFFFFFBFA),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
