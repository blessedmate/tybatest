import 'package:flutter/material.dart';
import 'package:tyba_test/widgets/input_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Name field
          InputField(
            icon: const Icon(Icons.person),
            labelText: 'Name',
            onChanged: (s) {},
          ),
          const SizedBox(height: 30),

          // Email field
          InputField(
            icon: const Icon(Icons.email),
            labelText: 'Email',
            onChanged: (s) {},
          ),
          const SizedBox(height: 30),

          // Password field
          InputField(
            icon: const Icon(Icons.lock),
            labelText: 'Password',
            onChanged: (s) {},
          ),
          const SizedBox(height: 30),

          // Sign up button
          MaterialButton(
            onPressed: () {},
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 16),
            ),
            color: Colors.indigo,
            textColor: Colors.white,
          ),
          const SizedBox(height: 30),

          // Login option
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Already have an account? ',
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onTap: () => Navigator.pushReplacementNamed(context, 'login'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
