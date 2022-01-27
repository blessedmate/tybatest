import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database? _localDatabase;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_localDatabase != null) {
      return _localDatabase!;
    }
    _localDatabase = await initDB();
    return _localDatabase!;
  }

  /// Start the database
  Future<Database> initDB() async {
    // Path of database location
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'HistoryDB.db');

    // Database creation
    return await openDatabase(
      path,
      version: 2,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute('''
        CREATE TABLE History(
          coords TEXT PRIMARY KEY
        )
      ''');
      },
    );
  }

  /// Retrieve all queries
  Future<List<String>?> getAllQueries() async {
    final db = await database;
    final response = await db.query('History');
    return response.isNotEmpty
        ? response.map((obj) => obj['coords'].toString()).toList()
        : null;
  }

  /// Save a query
  Future<int> saveQuery(String coords) async {
    final db = await database;
    final res = await db.insert(
      'History',
      {
        'coords': coords,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return res;
  }
}
