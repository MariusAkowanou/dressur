import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'dressur.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY,
        pseudo TEXT,
        tel TEXT,
        mail TEXT,
        password TEXT,
        uid TEXT, 
        nom TEXT,
        pays TEXT,
        apropos TEXT
      )
    ''');
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final Database? db = await database;
    if (db != null) {
      await db.insert('user', user,
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<String?> getUserUid(String email) async {
    final Database? db = await database;
    if (db != null) {
      List<Map<String, dynamic>> maps =
          await db.query('user', where: 'mail = ?', whereArgs: [email]);
      if (maps.length > 0) {
        return maps.first['uid'];
      }
    }
    return null;
  }
}
