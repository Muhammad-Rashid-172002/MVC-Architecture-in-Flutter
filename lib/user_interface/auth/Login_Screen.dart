import 'package:flutter/material.dart';
import 'package:practics/res/components/input_text_field.dart';
import 'package:practics/res/components/round_button.dart';
import 'package:practics/utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * .01),
                Text(
                  "Welcome Back!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: height * .01),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: height * .06,
                      bottom: height * .01,
                    ),
                    child: Column(
                      children: [
                        InputTextField(
                          myCrontroller: emailController,
                          focusNode: emailFocusNode,
                          hint: 'Email',
                          obscureText: false,
                          onFieldSubmittedValue: (value) {},
                          onvalidator: (value) {
                            return value.isEmpty ? 'Enter email' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        InputTextField(
                          myCrontroller: passwordController,
                          focusNode: passwordFocusNode,
                          hint: 'Password',
                          obscureText: true,
                          onFieldSubmittedValue: (value) {},
                          onvalidator: (value) {
                            return value.isEmpty ? 'Enter password' : null;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                RoundButton(
                  title: 'Login',
                  loading: false,
                  onpress: () {
                    if (_formKey.currentState!.validate()) {
                      // TODO: Add your login logic here
                    }
                  },
                ),
                SizedBox(height: height * .03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium!.copyWith(fontSize: 15),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.signUpScreen);
                      },
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium!
                            .copyWith(
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
