import 'package:flutter/material.dart';
import 'package:practics/res/components/input_text_field.dart';
import 'package:practics/res/components/round_button.dart';
import 'package:practics/utils/routes/routes_name.dart';
import 'package:practics/utils/routes/utiles.dart';
import 'package:practics/view_model/services/login/login_controller.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  bool _obscurePassword = true;

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => LoginController(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF833AB4), Color(0xFFFD1D1D), Color(0xFFFcb045)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Consumer<LoginController>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        SizedBox(height: height * 0.08),

                        /// App Logo/Icon
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(color: Colors.white70),
                          ),
                          child: const Icon(
                            Icons.people_alt_rounded,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 20),

                        ShaderMask(
                          shaderCallback: (bounds) => const LinearGradient(
                            colors: [Colors.yellow, Colors.orange, Colors.red],
                          ).createShader(bounds),
                          child: Text(
                            "Welcome Back",
                            style: Theme.of(context).textTheme.headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Login to continue",
                          style: TextStyle(color: Colors.white70),
                        ),

                        SizedBox(height: height * 0.06),

                        /// Login Card
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeOutCubic,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.25),
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  //Email
                                  InputTextField(
                                    myController: emailController,
                                    focusNode: emailFocusNode,
                                    hint: 'Email',
                                    obscureText: false,
                                    onFieldSubmittedValue: (_) {
                                      Utils.fieldFocus(
                                        context,
                                        emailFocusNode,
                                        passwordFocusNode,
                                      );
                                    },
                                    onValidator: (value) =>
                                        value!.isEmpty ? 'Enter email' : null,
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  const SizedBox(height: 15),

                                  // Password
                                  TextFormField(
                                    controller: passwordController,
                                    focusNode: passwordFocusNode,
                                    obscureText: _obscurePassword,
                                    validator: (value) => value!.isEmpty
                                        ? 'Enter password'
                                        : null,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.lock_outline,
                                        color: Colors.deepPurple,
                                      ),
                                      hintText: "Password",
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.85),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.deepPurple,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword =
                                                !_obscurePassword;
                                          });
                                        },
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),

                                  /// Login Button
                                  ChangeNotifierProvider(
                                    create: (_) => LoginController(),
                                    child: Consumer<LoginController>(
                                      builder: (context, provider, child) {
                                        return RoundButton(
                                          title: 'Login',
                                          loading: provider.loading,
                                          onpress: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              await provider.login(
                                                context,
                                                emailController.text.trim(),
                                                passwordController.text.trim(),
                                              );
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.03),

                        /// Social Media Logins
                        const Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _socialButton(Icons.g_mobiledata, Colors.red),
                            const SizedBox(width: 15),
                            _socialButton(Icons.facebook, Colors.blue),
                            const SizedBox(width: 15),
                            _socialButton(Icons.apple, Colors.black),
                          ],
                        ),

                        SizedBox(height: height * 0.04),

                        /// Navigation to Sign Up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.signUpScreen,
                                );
                              },
                              child: const Text(
                                'Sign Up',
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
          ),
        ),
      ),
    );
  }

  /// Social Media Button
  Widget _socialButton(IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // TODO: Social login logic
      },
      child: CircleAvatar(
        radius: 26,
        backgroundColor: Colors.white,
        child: Icon(icon, color: color, size: 30),
      ),
    );
  }
}
