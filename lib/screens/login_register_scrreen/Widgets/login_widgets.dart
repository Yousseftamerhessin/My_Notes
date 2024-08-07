import 'package:NotesApp/screens/login_register_scrreen/View/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:NotesApp/screens/login_register_scrreen/View/Login_screen.dart';

Widget buildTextField({
  required TextEditingController controller,
  required IconData icon,
  required String hintText,
  bool obscureText = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            icon: Icon(icon),
            border: InputBorder.none,
            hintText: hintText,
          ),
        ),
      ),
    ),
  );
}

Widget buildSignInButton(VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
            child: Text(
          'Sign in',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),
        )),
      ),
    ),
  );
}

Widget buildSignUpButton(VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: Text(
            'Sign up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildRegisterRedirectButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Not yet a member?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterScreen(),
            ),
          );
        },
        child: const Text(
          'Register Now',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

Widget buildLoginRedirectButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Already a member?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        child: const Text(
          'Sign in here',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
