import 'package:flutter/material.dart';
import 'package:votacion/domain/BD/SQLt/DatabaseSQLt.dart';

class PersonViewModel extends ChangeNotifier {

  void addpersona(String nombre,String apellido,String telefono,String fecha) async {
    DatabaseSQLt _databaseSQLt = DatabaseSQLt();
    await _databaseSQLt.insertPersonas(nombre, apellido, telefono, fecha);
    notifyListeners();
  }
}