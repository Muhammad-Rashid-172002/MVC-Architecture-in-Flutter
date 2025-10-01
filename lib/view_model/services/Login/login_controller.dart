import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practics/utils/routes/routes_name.dart';
import 'package:practics/utils/routes/utiles.dart';
import 'package:practics/view_model/services/session_manger.dart';

class LoginController with ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

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
      // Sign in user
      UserCredential value = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
 


          /// Save session userId
     // SessionController.instance.userId = value.user?.uid;



      // show success toast
      Utils.toastSuccess("Login successful");

      // Navigate to dashboard
      Navigator.pushNamed(context, RouteName.dashboardScreen);
    } on FirebaseAuthException catch (e) {
      setLoading(false);

      //  red toast for Firebase error
      Utils.toastError(e.message ?? "Login failed");
    } catch (e) {
      setLoading(false);

      //  red toast for unexpected errors
      Utils.toastError("Error: ${e.toString()}");
    }
  }
}
