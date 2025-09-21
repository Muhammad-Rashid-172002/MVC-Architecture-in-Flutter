import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:practics/utils/routes/routes_name.dart';
import 'package:practics/utils/routes/utiles.dart';

class LoginController with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref().child('Users');

  bool _isLoading = false;
  bool get loading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(
    BuildContext context,
    String email,
    String password,
  ) async {
    setLoading(true);

    try {
      // sign in user with firebase auth
      UserCredential value = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // update user online status
      await ref.child(value.user!.uid).update({'onlineStatus': 'online'});

      setLoading(false);

      // show success msg
      Utils.toastMessage("Login successful");

      // navigate to dashboard
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.dashboardScreen,
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      setLoading(false);
      Utils.toastMessage(e.message ?? "Invalid email or password");
    } catch (e) {
      setLoading(false);
      Utils.toastMessage(e.toString());
    }
  }
}
