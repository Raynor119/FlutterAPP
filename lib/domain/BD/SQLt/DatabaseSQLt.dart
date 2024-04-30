import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

class DatabaseSQLt {
  static late Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }
  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Personas(id INTEGER PRIMARY KEY,nombre TEXT,apellido TEXT,telefono TEXT,FechaN TEXT)
    ''');
  }


  Future<void> insertPersonas(String nombre,String apellido,String telefono,String fechan) async {
    final Database db = await database;
    await db.insert(
      'Personas',
      {
        'nombre': nombre,
        'apellido': apellido,
        'telefono': telefono,
        'FechaN': fechan
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }


  Future<List<String>> getNombres() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Personas');
    return List.generate(maps.length, (i) {
      return maps[i]['nombre'] as String;
    });
  }
}