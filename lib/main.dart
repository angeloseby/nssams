import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nssams/firebase_options.dart';
import 'package:nssams/providers/auth_provider.dart';
import 'package:nssams/utils/auth_wrapper.dart';
import 'package:nssams/utils/custom_color_scheme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'NSSAMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: CustomColorScheme.mainColor,
          ),
          scaffoldBackgroundColor: const Color(0xFFFFFBFA),
          useMaterial3: true,
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}
