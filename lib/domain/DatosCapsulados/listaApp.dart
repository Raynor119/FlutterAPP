class ListaDatos{
  late int _Id;
  late String _Nombre;
  late String _Apellido;
  late String _Telefono;
  late String _FechaN;


  ListaDatos(
      this._Id, this._Nombre, this._Apellido, this._Telefono, this._FechaN);

  String get FechaN => _FechaN;

  set FechaN(String value) {
    _FechaN = value;
  }

  String get Telefono => _Telefono;

  set Telefono(String value) {
    _Telefono = value;
  }

  String get Apellido => _Apellido;

  set Apellido(String value) {
    _Apellido = value;
  }

  String get Nombre => _Nombre;

  set Nombre(String value) {
    _Nombre = value;
  }

  int get Id => _Id;

  set Id(int value) {
    _Id = value;
  }
}