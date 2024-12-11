import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  bool _isSignedIn = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isSignedIn => _isSignedIn;

  Future<void> signIn(
      BuildContext context, String nssId, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Perform anonymous sign-in
      UserCredential userCredential =
          await FirebaseAuth.instance.signInAnonymously();

      _user = userCredential.user;

      // Upload user details to Firestore
      await _fetchUserDetails(nssId, password);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();

      // Show error dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: ${e.toString()}'),
        ),
      );
    }
  }

  // Future<void> _uploadUserDetails() async {
  //   if (_user == null) return;

  //   try {
  //     await FirebaseFirestore.instance.collection('users').doc(_user!.uid).set({
  //       'uid': _user!.uid,
  //       'isAnonymous': _user!.isAnonymous,
  //       'createdAt': FieldValue.serverTimestamp(),
  //       'lastLogin': FieldValue.serverTimestamp(),
  //       'loginCount': FieldValue.increment(1)
  //     }, SetOptions(merge: true));
  //   } catch (e) {
  //     print('Error uploading user details: $e');
  //   }
  // }

  Future<void> _fetchUserDetails(String nssId, String password) async {
    if (_user == null) return;

    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(nssId).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;
        String name = data?['name'] ?? 'No name found';
        String storedPassword = data?['password'] ?? 0;

        if (password == storedPassword) {
          print('Name: $name, Password: $password');
          _isSignedIn = true;
          notifyListeners();
        } else {
          print("Passwords doesn't match");
        }
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching document: $e');
    }
  }

  // Sign Out Method
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _user = null;
    _isSignedIn = false;
    notifyListeners();
  }
}
