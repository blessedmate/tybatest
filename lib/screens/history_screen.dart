import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tyba_test/services/history_service.dart';
import 'package:tyba_test/widgets/menu.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final historyProvider = Provider.of<HistoryService>(context);
    historyProvider.getAllQueries();
    final historyList = historyProvider.history;

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      drawer: const Menu(),
      body: historyList.isEmpty
          ? const Center(child: Text('No history available..'))
          : ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(historyList[index]);
              },
            ),
    );
  }
}
