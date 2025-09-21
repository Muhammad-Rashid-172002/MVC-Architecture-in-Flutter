import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:practics/utils/routes/routes_name.dart';
import 'package:practics/utils/routes/utiles.dart';

class SignUpController with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  bool _isLoading = false;
  bool get loading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signUp(
    BuildContext context,
    String username,
    String email,
    String password,
    String confirmPassword,
  ) async {
    // check confirm password
    if (password != confirmPassword) {
      Utils.toastMessage("Passwords do not match");
      return;
    }

    setLoading(true);

    try {
      // Create user in Firebase Auth
      UserCredential value = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user info in Realtime Database
      await ref.child(value.user!.uid).set({
        'uid': value.user!.uid,
        'email': value.user!.email,
        'onlineStatus': 'offline',
        'phone': '',
        'username': username,
        'profile': '',
      });

      setLoading(false);

      // Show success message
      Utils.toastMessage("Account created successfully");

      // Navigate to dashboard
      Navigator.pushNamed(context, RouteName.dashboardScreen);
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      Utils.toastMessage(e.message ?? "Authentication failed");
    } catch (e) {
      setLoading(false);
      Utils.toastMessage("Error: ${e.toString()}");
    }
  }
}
