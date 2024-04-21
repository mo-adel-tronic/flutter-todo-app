import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;
class SqlDB {
  static Database? _db;

  Future<Database> initDB() async{
    String dbPath = await getDatabasesPath();
    String sqlPath = path.join(dbPath, 'todo_db.db');

    Database todoDb = await openDatabase(sqlPath,
    onCreate: _onCreate,
    version: 2,
    onUpgrade: _onupgrade
    );
    return todoDb;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("""
CREATE TABLE "notes" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "note_body" TEXT NOT NULL 
);
""");
  }
  Future _onupgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("""
CREATE TABLE "notes" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "note_body" TEXT NOT NULL,
  "finished" INTEGER DEFAULT 0
);
""");
  }

  Future<Database?> getDb () async {
    _db ??= await initDB();
    return _db;
  }

  // ****** Usage ****************
  Future<List<Map>> readData(String sql) async {
    Database? mydb = await getDb();
    return await mydb!.rawQuery(sql); 
  }
  Future<int> insertData(String sql) async {
    Database? mydb = await getDb();
    return await mydb!.rawInsert(sql); 
  }
  Future<int> updateData(String sql) async {
    Database? mydb = await getDb();
    return await mydb!.rawUpdate(sql); 
  }
  Future<int> deleteData(String sql) async {
    Database? mydb = await getDb();
    return await mydb!.rawDelete(sql); 
  }
}