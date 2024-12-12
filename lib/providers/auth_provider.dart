import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nssams/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  UserModel? _user;
  UserModel? get user => _user;

  Future<void> fetchUserDetails(String nssId, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(nssId).get();

      if (documentSnapshot.exists) {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;

        if (UserModel.fromMap(data).passwordMatches(password)) {
          // Create UserModel instance with fetched data
          UserModel newUser = UserModel.fromMap(data);
          _isSignedIn = true; // Assuming a boolean field for signed-in state
          _user = newUser;
          _isLoading = false;
          notifyListeners(); // Assuming a listener mechanism for state changes
        } else {
          print("Passwords don't match"); // Indicate unsuccessful login
          _isLoading = false;
          notifyListeners();
        }
      } else {
        print('User not found');
      }
    } catch (e) {
      print('Error fetching user: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _isLoading = true;
    await FirebaseAuth.instance.signOut();
    // Update user state (assuming separate fields)
    _isSignedIn = false;
    _user = null;
    _isLoading = false;
    notifyListeners();
  }

//   Future<void> uploadUserDetails(String nssId, UserModel userDetails) async {
//     try {
//       await FirebaseFirestore.instance.collection('users').doc(nssId).set({
//         'uid': _user!.uid,
//         'isAnonymous': _user!.isAnonymous,
//         'createdAt': FieldValue.serverTimestamp(),
//         'lastLogin': FieldValue.serverTimestamp(),
//         'loginCount': FieldValue.increment(1),
//         // Include other relevant user details from UserModel
//         'name': userDetails.name,
//         'position': userDetails.position,
//         'year': userDetails.year,
//         'department': userDetails.department,
//         'bloodGroup': userDetails.bloodGroup,
//         'nssJoinYear': userDetails.nssJoinYear,
//         'dob': userDetails.dob?.millisecondsSinceEpoch,
//       }, SetOptions(merge: true));
//     } catch (e) {
//       print('Error uploading user details: $e');
//     }
//   }

//   // Assuming separate variables to manage user state
//   bool isSignedIn = false;
//   UserModel? user;
// }
}
