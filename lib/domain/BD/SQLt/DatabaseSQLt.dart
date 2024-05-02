import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';

import '../../DatosCapsulados/listaApp.dart';

class DatabaseSQLt {
  static late Database _database;
  static bool _initialized = false;

  Future<void> initialize() async {
    if (!_initialized) {
      await _initDatabase();
      _initialized = true;
    }
  }

  Future<void> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'database.db');
    _database = await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<Database> get database async {
    await initialize(); // Asegúrate de que la base de datos esté inicializada antes de acceder a ella
    return _database;
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Personas(id INTEGER PRIMARY KEY,nombre TEXT,apellido TEXT,telefono TEXT,FechaN TEXT)
    ''');
  }

  Future<void> insertPersonas(String nombre, String apellido, String telefono, String fechan) async {
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

  Future<List<ListaDatos>> getPersonas() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('Personas');

    return List.generate(maps.length, (i) {
      return ListaDatos(
        maps[i]['nombre'],
        maps[i]['apellido'],
        maps[i]['telefono'],
        maps[i]['FechaN'],
      );
    });
  }
}