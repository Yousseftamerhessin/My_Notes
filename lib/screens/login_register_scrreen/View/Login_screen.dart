import 'package:NotesApp/screens/login_register_scrreen/Widgets/login_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false; 

  Future<void> signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.of(context).pushReplacementNamed('/');   
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: ${e.toString()}')),
      );
    } finally {
      setState(() {
        _isLoading = false; 
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                const SizedBox(height: 20.0),
                const Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Welcome back! Nice to see you again :-)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50.0),
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
                const SizedBox(height: 15),
                _isLoading
                  ? const CircularProgressIndicator() 
                  : buildSignInButton(signIn),
                const SizedBox(height: 20),
                buildRegisterRedirectButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
