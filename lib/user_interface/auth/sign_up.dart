import 'package:flutter/material.dart';
import 'package:practics/res/components/input_text_field.dart';
import 'package:practics/res/components/round_button.dart';
import 'package:practics/utils/routes/routes_name.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * .01),
                Text(
                  "Create an Account",
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
                          myCrontroller: nameController,
                          focusNode: nameFocusNode,
                          hint: 'Name',
                          obscureText: false,
                          onFieldSubmittedValue: (value) {},
                          onvalidator: (value) {
                            return value.isEmpty ? 'Enter Name' : null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
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
                        SizedBox(height: 10),
                        InputTextField(
                          myCrontroller: confirmPasswordController,
                          focusNode: confirmPasswordFocusNode,
                          hint: 'Confirm Password',
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

                const SizedBox(height: 40),
                RoundButton(
                  title: 'Sign Up',
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
                    Text("Already have an account?"),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.signUpScreen);
                      },
                      child: Text(
                        'Login',
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
