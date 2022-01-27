import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tyba_test/db/db_provider.dart';

class HistoryService extends ChangeNotifier {
  List<String> history = [];

  /// Get all queries from the local DB
  getAllQueries() async {
    final dbqueries = await DBProvider.db.getAllQueries();
    if (dbqueries != null) {
      history = [...dbqueries];
    }
    notifyListeners();
  }

  // /// Saves a query in the local DB
  // Future saveQuery(String coords) async {
  //   final res = await DBProvider.db.saveQuery(coords);
  //   if (res != 0) {
  //     history.add(coords);
  //   }
  //   // Update UI
  //   notifyListeners();
  // }
}
