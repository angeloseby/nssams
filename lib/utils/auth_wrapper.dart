// Authentication Wrapper
import 'package:flutter/material.dart';
import 'package:nssams/providers/auth_provider.dart';
import 'package:nssams/screens/home_screen.dart';
import 'package:nssams/screens/login_page.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, child) {
        if (authProvider.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return authProvider.isSignedIn == true
            ? const HomeScreen()
            : const LoginPage();
      },
    );
  }
}
