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
    setLoading(true);

    try {
      // ✅ create user in firebase auth
      UserCredential value = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ✅ save user info in realtime database
      await ref.child(value.user!.uid).set({
        'uid': value.user!.uid,
        'email': value.user!.email,
        'onlineStatus': 'noOne',
        'phone': '',
        'username': username,
        'profile': '',
      });

      setLoading(false);

      // ✅ green toast on success
      Utils.toastSuccess("Account created successfully");

      // ✅ navigate to dashboard
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.dashboardScreen,
        (route) => true,
      );
    } on FirebaseAuthException catch (e) {
      setLoading(false);

      // ❌ red toast on Firebase error
      Utils.toastError(e.message ?? "Something went wrong");
    } catch (e) {
      setLoading(false);

      // ❌ red toast on unexpected error
      Utils.toastError("Error: ${e.toString()}");
    }
  }
}
