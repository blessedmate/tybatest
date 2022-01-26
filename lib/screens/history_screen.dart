import 'package:flutter/material.dart';
import 'package:tyba_test/widgets/menu.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      drawer: Menu(),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
