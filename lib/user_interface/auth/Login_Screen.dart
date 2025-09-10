import 'package:flutter/material.dart';
import 'package:practics/res/components/input_text_field.dart';
import 'package:practics/res/components/round_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final emailFcusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InputTextField(
            myCrontroller: emailController,
            focusNode: emailFcusNode,
            hint: 'Email',
            obscureText: false,
            onFieldSubmittedValue: (value) {},
            onvalidator: (value) {
              return value.isEmplty ? 'Enter email' : null;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 40),
          RoundButton(title: 'Login', loading: false, onpress: () {}),
        ],
      ),
    );
  }
}
