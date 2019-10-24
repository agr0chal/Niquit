import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'CigModel.dart';
import 'CureModel.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Cigarettes ("
          "id INTEGER PRIMARY KEY,"
          "year INTEGER,"
          "month INTEGER,"
          "day INTEGER,"
          "hour INTEGER,"
          "minute INTEGER"
          ");"
          "CREATE TABLE Curation ("
          "id INTEGER PRIMARY KEY,"
          "year INTEGER,"
          "month INTEGER,"
          "day INTEGER,"
          "amount INTEGER"
          ");");
    });
  }

  newCig(Cigs newCig) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Cigarettes");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Cigarettes (id,year,month,day,hour,minute)"
        " VALUES (?,?,?,?,?,?)",
        [
          id,
          newCig.year,
          newCig.month,
          newCig.day,
          newCig.hour,
          newCig.minute
        ]);
    return raw;
  }

  newCure(Cure newCure) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Curation");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Curation (id,year,month,day,amount)"
        " VALUES (?,?,?,?,?)",
        [id, newCure.year, newCure.month, newCure.day, newCure.amount]);
    return raw;
  }

  Future<List<Cigs>> getSpecCigs(year, month, day) async {
    final db = await database;
    var res = await db.rawQuery(
        "SELECT * FROM Cigarettes WHERE year=$year AND month=$month AND day=$day");
    List<Cigs> list =
        res.isNotEmpty ? res.map((c) => Cigs.fromMap(c)).toList() : [];
    return list;
  }

  Future<Cigs> getCig(int id) async {
    final db = await database;
    var res = await db.query("Cigarettes", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Cigs.fromMap(res.first) : null;
  }

  Future<int> getAmt(year, month, day) async {
    var dbClient = await database;
    return Sqflite.firstIntValue(await dbClient.rawQuery(
        'SELECT COUNT(*) FROM Cigarettes WHERE year=$year AND month=$month AND day=$day'));
  }

  Future<List<Cure>> getSpecCure(year, month, day) async {
    final db = await database;
    var res = await db.rawQuery(
        "SELECT * FROM Curation WHERE year=$year AND month=$month AND day=$day");
    List<Cure> list =
        res.isNotEmpty ? res.map((c) => Cure.fromMap(c)).toList() : [];
    return list;
  }

  deleteAll() async {
    final db = await database;
    //db.rawDelete("DELETE FROM Curation");
    db.rawDelete("DELETE FROM Cigarettes");
  }
}
