import 'package:flutter/material.dart';
import 'package:votacion/domain/BD/SQLt/DatabaseSQLt.dart';
import 'package:votacion/domain/DatosCapsulados/listaApp.dart';

class PersonViewModel extends ChangeNotifier {
  List<ListaDatos> _personas = [];
  List<ListaDatos> get personas => _personas;

  PersonState _state = PersonState.loading;
  String? _error;

  PersonState get state => _state;
  String? get error => _error;

  // Método privado para actualizar el estado y notificar a los escuchadores
  void _updateState(PersonState newState, [String? newError]) {
    _state = newState;
    _error = newError;
    notifyListeners();
  }

  void addPersona(String nombre, String apellido, String telefono, String fecha) async {
    try {
      DatabaseSQLt _databaseSQLt = DatabaseSQLt();
      await _databaseSQLt.insertPersonas(nombre, apellido, telefono, fecha);
      await getPersonas(); // Actualiza la lista después de agregar una persona
    } catch (e) {
      _updateState(PersonState.error, e.toString());
    }
  }

  Future<void> getPersonas() async {
    try {
      DatabaseSQLt _databaseSQLt = DatabaseSQLt();
      _personas = await _databaseSQLt.getPersonas();
      _updateState(PersonState.loaded);
    } catch (e) {
      _updateState(PersonState.error, e.toString());
    }
  }

  Future<void> deletePersona(int id) async {
    try {
      DatabaseSQLt _databaseSQLt = DatabaseSQLt();
      await _databaseSQLt.deletePersona(id);
      await getPersonas(); // Espera a que se complete la eliminación antes de actualizar la lista
    } catch (e) {
      _updateState(PersonState.error, e.toString());
    }
  }
}
enum PersonState {
  loading,
  loaded,
  error,
}