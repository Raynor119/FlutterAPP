import 'package:flutter/material.dart';
import 'package:votacion/domain/BD/SQLt/DatabaseSQLt.dart';
import 'package:votacion/domain/DatosCapsulados/listaApp.dart';

class PersonViewModel extends ChangeNotifier {
  List<ListaDatos> _personas = [];

  // Getter para acceder a la lista de personas
  List<ListaDatos> get personas => _personas;

  void addpersona(String nombre,String apellido,String telefono,String fecha) async {
    DatabaseSQLt _databaseSQLt = DatabaseSQLt();
    await _databaseSQLt.insertPersonas(nombre, apellido, telefono, fecha);
    notifyListeners();
  }

  // Método para obtener la lista de personas
  Future<void> getPersonas() async {
    DatabaseSQLt _databaseSQLt = DatabaseSQLt();
    _personas = await _databaseSQLt.getPersonas();
    notifyListeners();
  }


}