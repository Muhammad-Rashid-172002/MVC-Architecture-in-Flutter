import 'package:flutter/material.dart';
import 'package:practics/res/components/input_text_field.dart';
import 'package:practics/res/components/round_button.dart';
import 'package:practics/utils/routes/routes_name.dart';
import 'package:practics/utils/routes/utiles.dart';
import 'package:practics/view_model/services/signup/sign_up_controller.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final nameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

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

    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (_) => SignUpController(),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: SingleChildScrollView(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Consumer<SignUpController>(
                      builder: (context, provider, child) {
                        return Column(
                          children: [
                            SizedBox(height: height * 0.08),

                            /// App Logo
                            AnimatedScale(
                              duration: const Duration(milliseconds: 800),
                              scale: 1.2,
                              curve: Curves.elasticOut,
                              child: const Icon(
                                Icons.people_alt_rounded,
                                size: 85,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 15),

                            /// Gradient Title
                            ShaderMask(
                              shaderCallback: (bounds) => const LinearGradient(
                                colors: [
                                  Colors.yellow,
                                  Colors.orange,
                                  Colors.red,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                              child: Text(
                                "Create Account",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 1.3,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Join us and connect with the world 🌍",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: Colors.white70),
                            ),

                            SizedBox(height: height * 0.06),

                            /// Glassmorphic Sign Up Form
                            AnimatedContainer(
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
                                    /// Full Name
                                    InputTextField(
                                      myController: nameController,
                                      focusNode: nameFocusNode,
                                      hint: 'Full Name',
                                      obscureText: false,
                                      onFieldSubmittedValue: (_) {
                                        Utils.fieldFocus(
                                          context,
                                          nameFocusNode,
                                          emailFocusNode,
                                        );
                                      },
                                      onValidator: (value) => value!.isEmpty
                                          ? 'Enter your name'
                                          : null,
                                      keyboardType: TextInputType.text,
                                    ),
                                    const SizedBox(height: 15),

                                    /// Email
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

                                    /// Password
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
                                        fillColor: Colors.white.withOpacity(
                                          0.85,
                                        ),
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
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 15),

                                    /// Confirm Password
                                    TextFormField(
                                      controller: confirmPasswordController,
                                      focusNode: confirmPasswordFocusNode,
                                      obscureText: _obscureConfirmPassword,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Confirm your password';
                                        } else if (value !=
                                            passwordController.text.trim()) {
                                          return 'Passwords do not match';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock_reset_outlined,
                                          color: Colors.deepPurple,
                                        ),
                                        hintText: "Confirm Password",
                                        filled: true,
                                        fillColor: Colors.white.withOpacity(
                                          0.85,
                                        ),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            _obscureConfirmPassword
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: Colors.deepPurple,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _obscureConfirmPassword =
                                                  !_obscureConfirmPassword;
                                            });
                                          },
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),

                                    /// Gradient SignUp Button
                                    AnimatedOpacity(
                                      opacity: 1,
                                      duration: const Duration(
                                        milliseconds: 1200,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFFFD1D1D),
                                              Color(0xFFFcb045),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.2,
                                              ),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: RoundButton(
                                          title: 'Sign Up',
                                          loading: provider.loading,
                                          onpress: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              print("button pressed");
                                              final successSignUp =
                                                  await provider.signUp(
                                                    context,
                                                    nameController.text.trim(),
                                                    emailController.text.trim(),
                                                    passwordController.text
                                                        .trim(),
                                                    confirmPasswordController
                                                        .text
                                                        .trim(),
                                                  );
                                              if (successSignUp) {
                                                print("success");
                                                Navigator.pushNamed(
                                                  context,
                                                  RouteName.dashboardScreen,
                                                );
                                                print("navigation done");
                                              }
                                            }
                                          },
                                        ),
                                      
                                      
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: height * 0.04),

                            /// Social Logins
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: Column(
                                children: [
                                  const Text(
                                    "Or sign up with",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      _socialButton(
                                        Icons.g_mobiledata,
                                        Colors.red,
                                      ),
                                      const SizedBox(width: 15),
                                      _socialButton(
                                        Icons.facebook,
                                        Colors.blue,
                                      ),
                                      const SizedBox(width: 15),
                                      _socialButton(Icons.apple, Colors.black),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: height * 0.05),

                            /// Sign In Navigation
                            SlideTransition(
                              position: _slideAnimation,
                              child: Row(
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
                                        RouteName.signInScreen,
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
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Custom Social Button
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
