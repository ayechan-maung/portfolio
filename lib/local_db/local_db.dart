import 'package:path/path.dart' as path;
import 'package:portfolio/model/work_exp_ob.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class LocalDb {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath, 'portfolio.db'),
        onCreate: (db, version) => db.execute(
            'CREATE TABLE work_exp (title TEXT, role TEXT, year TEXT, image TEXT)'),
        version: 1);
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await LocalDb.database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<WorkExp>> getData(String table) async {
    final db = await LocalDb.database();
    // print('db value ***** <<>> ' + db.query(table).toString());
    final getDb = await db.query(table) as List;
    if (getDb.length > 0) {
      return getDb
          .map((e) => WorkExp.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return [];
  }
}
