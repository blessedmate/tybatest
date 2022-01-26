import 'package:flutter/material.dart';
import 'package:tyba_test/widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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

          // Sign in button
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

          // Sign up option
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account? ',
                style: TextStyle(fontSize: 16),
              ),
              GestureDetector(
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                onTap: () => Navigator.pushReplacementNamed(context, 'sign-up'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
