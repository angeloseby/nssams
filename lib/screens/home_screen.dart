import 'package:flutter/material.dart';
import 'package:nssams/models/user_model.dart';
import 'package:nssams/providers/auth_provider.dart';
import 'package:nssams/utils/custom_color_scheme.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel? currentUser = authProvider.user;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add user profile picture and name here
            ListTile(
              title: Text(currentUser!.name!),
              subtitle: Text(currentUser.position!.toUpperCase()),
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            const Divider(),
            // Add other user details here
            ListTile(
              title: const Text('Department'),
              subtitle: Text(currentUser.department!),
              leading: const Icon(Icons.folder),
            ),
            ListTile(
              title: const Text('Joined Year'),
              subtitle: Text(currentUser.nssJoinYear!),
              leading: const Icon(Icons.calendar_today),
            ),
            ListTile(
              title: const Text('Blood Group'),
              subtitle: Text(currentUser.bloodGroup!),
              leading: const Icon(Icons.bloodtype),
            ),
            ListTile(
              title: const Text('Activity Hours'),
              subtitle: Text(currentUser.activityHours!.toString()),
              leading: const Icon(Icons.lock_clock),
            ),
            const Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                backgroundColor: CustomColorScheme.mainColor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                authProvider.signOut();
              },
              child: const Text("Sign Out"),
            ),
            const Spacer(),
            // ... Add more ListTile items as needed
          ],
        ),
      ),
    );
  }
}
