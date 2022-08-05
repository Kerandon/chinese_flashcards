import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/word.dart';

class DatabaseManager {


  //Singleton
  DatabaseManager._internal();

  static final _instance = DatabaseManager._internal();

  factory DatabaseManager() => _instance;

  //Database
  final String _database = 'flashcards.db',
      _table = 'words',
      _column1 = 'topic',
      _column2 = 'english',
      _column3 = 'character',
      _column4 = 'pinyin';

  Future<Database> initDatabase() async {
    final devicesPath = await getDatabasesPath();
    final path = join(devicesPath, _database);

    return await openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE $_table($_column1 TEXT, $_column2 TEXT PRIMARY KEY, $_column3 TEXT, $_column4 TEXT)');
    }, version: 1);

  }

  Future<void> insertWord({required Word word}) async {
    final db = await initDatabase();
    await db.insert(_table, word.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);


  }

  Future<List<Word>> selectWords({int? limit}) async {
    final db = await initDatabase();
    List<Map<String, dynamic>> maps = await db.query(_table, limit: limit, orderBy: 'RANDOM()');
    return List.generate(maps.length, (index) => Word.fromMap(map: maps[index]));

  }

  Future<void> removeWord({required Word word}) async {
    final db = await initDatabase();
    await db.delete(_table, where: 'english = ?', whereArgs: [word.english]);

  }

  Future<void> removeAllWords() async {
    final db = await initDatabase();
    await db.delete(_table);

  }

  Future<void> removeDatabase() async {
    final devicesPath = await getDatabasesPath();
    final path = join(devicesPath, _database);
   await deleteDatabase(path);

  }


}