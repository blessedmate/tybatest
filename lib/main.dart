import 'package:flutter/material.dart';
import 'package:tyba_test/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tyba Test',
      initialRoute: 'home',
      routes: {
        'login': (_) => const LoginScreen(),
        'sign-up': (_) => const SignUpScreen(),
        'home': (_) => const HomeScreen(),
        'history': (_) => const HistoryScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
      ),
    );
  }
}
