import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyba_test/screens/screens.dart';
import 'package:tyba_test/services/history_service.dart';
import 'package:tyba_test/services/restaurants_service.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RestaurantsService()),
        ChangeNotifierProvider(create: (_) => HistoryService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tyba Test',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'sign-up': (_) => SignUpScreen(),
        'home': (_) => const HomeScreen(),
        'history': (_) => const HistoryScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(elevation: 0, color: Colors.indigo),
      ),
    );
  }
}
