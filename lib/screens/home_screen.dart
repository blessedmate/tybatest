import 'package:flutter/material.dart';
import 'package:tyba_test/widgets/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants'),
      ),
      drawer: Menu(),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
