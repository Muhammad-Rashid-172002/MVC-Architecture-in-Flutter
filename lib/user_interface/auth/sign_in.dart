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
        body: Stack(
          children: [
            /// Background Gradient
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6D5DF6), Color(0xFF3D3BCE)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

            /// Top Wave Shape
            ClipPath(
              clipper: _TopWaveClipper(),
              child: Container(
                height: height * 0.35,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.white70],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                child: Consumer<SignUpController>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        SizedBox(height: height * 0.08),

                        /// App Logo/Icon
                        const Icon(
                          Icons.account_circle,
                          size: 100,
                          color: Color(0xFF6D5DF6),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          "Create Account",
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 1.2,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Join us and explore more",
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(color: Colors.white70),
                        ),

                        SizedBox(height: height * 0.05),

                        /// Glassmorphism Card
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
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
                                const SizedBox(height: 15),
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
                                const SizedBox(height: 15),
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
                                const SizedBox(height: 15),
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
                                const SizedBox(height: 30),

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
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.03),

                        /// Navigation to Login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.SignUpScreen,
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Custom Wave Shape
class _TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    var secondControlPoint = Offset(3 * size.width / 4, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
