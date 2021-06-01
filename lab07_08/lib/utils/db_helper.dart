import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import '../model/computer_game.dart';

class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String GENRE = 'genre';
  static const String YEAR = 'year';
  static const String TABLE = 'ComputerGame';
  static const String DB_NAME = 'computer_game.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE $TABLE ($ID TEXT PRIMARY KEY, $NAME TEXT, $GENRE TEXT, $YEAR INTEGER)');
  }

  Future<ComputerGame> save(ComputerGame computerGame) async {
    var dbClient = await db;
    computerGame.id = (await dbClient.insert(TABLE, computerGame.toMap())) as String;
    return computerGame;
  }

  Future<List<ComputerGame>> getComputerGames() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, columns: [ID, NAME, GENRE, YEAR]);
    //List<Map> maps = await dbClient.rawQuery('SELECT * FROM $TABLE');
    List<ComputerGame> computerGames = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        computerGames.add(ComputerGame.fromMap(maps[i]));
      }
    }
    return computerGames;
  }

  Future<int> delete(String id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(ComputerGame computerGame) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, computerGame.toMap(),
        where: '$ID = ?', whereArgs: [computerGame.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
