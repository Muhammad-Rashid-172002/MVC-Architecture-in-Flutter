import 'package:flutter/material.dart';
import 'package:practics/res/components/input_text_field.dart';
import 'package:practics/res/components/round_button.dart';
import 'package:practics/utils/routes/routes_name.dart';
import 'package:practics/view_model/services/signup/sign_up_controller.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => SignUpController(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Consumer<SignUpController>(
              builder: (context, provider, child) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: height * .01),
                      Text(
                        "Create an Account",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(height: height * .01),

                      /// Form
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
                                onFieldSubmittedValue: (_) {},
                                onvalidator: (value) =>
                                    value.isEmpty ? 'Enter Name' : null,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 10),
                              InputTextField(
                                myCrontroller: emailController,
                                focusNode: emailFocusNode,
                                hint: 'Email',
                                obscureText: false,
                                onFieldSubmittedValue: (_) {},
                                onvalidator: (value) =>
                                    value.isEmpty ? 'Enter Email' : null,
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(height: 10),
                              InputTextField(
                                myCrontroller: passwordController,
                                focusNode: passwordFocusNode,
                                hint: 'Password',
                                obscureText: true,
                                onFieldSubmittedValue: (_) {},
                                onvalidator: (value) =>
                                    value.isEmpty ? 'Enter Password' : null,
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 10),
                              InputTextField(
                                myCrontroller: confirmPasswordController,
                                focusNode: confirmPasswordFocusNode,
                                hint: 'Confirm Password',
                                obscureText: true,
                                onFieldSubmittedValue: (_) {},
                                onvalidator: (value) {
                                  if (value.isEmpty) {
                                    return 'Confirm your password';
                                  } else if (value !=
                                      passwordController.text.trim()) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// Sign Up Button
                      RoundButton(
                        title: 'Sign Up',
                        loading: provider.loading,
                        onpress: () async {
                          if (_formKey.currentState!.validate()) {
                            await provider.signUp(
                              context,
                              nameController.text.trim(),
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              confirmPasswordController.text.trim(),
                            );
                          }
                        },
                      ),

                      SizedBox(height: height * .03),

                      /// Navigation to Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.SignUpScreen,
                              );
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
