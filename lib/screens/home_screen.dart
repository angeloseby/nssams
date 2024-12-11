import 'package:flutter/material.dart';
import 'package:nssams/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Home Page"),
            TextButton(
                onPressed: () {
                  authProvider.signOut();
                },
                child: const Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
