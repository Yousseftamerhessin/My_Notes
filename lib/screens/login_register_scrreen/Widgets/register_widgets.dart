import 'package:NotesApp/screens/login_register_scrreen/Widgets/login_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    if (passwordConfirmed()) {
      try {
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        final user = userCredential.user;

        await user?.updateProfile(displayName: _userNameController.text.trim());

        await user?.reload();
        Navigator.of(context).pushNamed('/');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up: ${e.toString()}')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
    }
  }

  bool passwordConfirmed() {
    return _passwordController.text.trim() ==
        _confirmPasswordController.text.trim();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/photo/NotesIcon.png',
                  height: 150.0,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'SIGN UP',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Welcome! Here you can sign up :-)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                buildTextField(
                  controller: _userNameController,
                  icon: Icons.person,
                  hintText: "User name",
                ),
                const SizedBox(height: 10),
                buildTextField(
                  controller: _emailController,
                  icon: Icons.email,
                  hintText: "Email Address",
                ),
                const SizedBox(height: 10),
                buildTextField(
                  controller: _passwordController,
                  icon: Icons.lock,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                buildTextField(
                  controller: _confirmPasswordController,
                  icon: Icons.lock,
                  hintText: "Confirm password",
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                buildSignUpButton(signUp),
                const SizedBox(height: 20),
                buildLoginRedirectButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
