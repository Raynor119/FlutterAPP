import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:votacion/domain/DatosCapsulados/listaApp.dart';
import 'package:votacion/infraestruture/ViewModel/ListaPersonaViewModel.dart';
import 'package:votacion/ui/Componentes/Colores.dart' as Colores;


class ListaPersonas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
        title: Text("Lista de Personas"),
        titleTextStyle: TextStyle(
            color: _darktheme ? Colors.white : Colors.white, fontSize: 22),
        iconTheme: IconThemeData(
          color: _darktheme ? Colors.white : Colors.white, // Cambia el color de la flecha según el tema
        ),
      ),
      body: Page(),
    );
  }
}


class Page extends StatefulWidget {
  Page({Key? key}) : super(key: key);
  @override
  _Page createState() => _Page();
}

class _Page extends State<Page> {
  late List<ListaDatos> _personas;
  late ScrollController _scrollController; // Agregar controlador de desplazamiento

  @override
  void initState() {
    super.initState();
    _personas = [];
    _scrollController = ScrollController(); // Inicializar el controlador
  }

  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    final _personViewModel = Provider.of<PersonViewModel>(context); // Obtener instancia de PersonViewModel

    // Llamar a getPersonas para asegurarse de que la lista esté actualizada
    _personViewModel.getPersonas();

    return Center(
      child: Container(
        child: Consumer<PersonViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.state == PersonState.loading) {
              return CircularProgressIndicator();
            } else if (viewModel.state == PersonState.error) {
              return Text('Error: ${viewModel.error}');
            } else {
              _personas = viewModel.personas; // Actualizar la lista de personas
              return Container(
                color: _darktheme ? Colores.negrototal : Colores.fondomodoblanco,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: ListView.builder(
                  controller: _scrollController, // Asignar el controlador
                  itemCount: _personas.length,
                  itemBuilder: (context, index) {
                    final person = _personas[index];
                    return MyCard(
                      key: ValueKey(person.Id), // Utilizar el ID como clave
                      index: index,
                      id: person.Id,
                      nombre: person.Nombre,
                      apellido: person.Apellido,
                      telefono: person.Telefono,
                      fecha: person.FechaN,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class MyCard extends StatefulWidget {
  final Key key;
  final int index;
  final int id;
  final String nombre;
  final String apellido;
  final String telefono;
  final String fecha;

  const MyCard({
    required this.key,
    required this.index,
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.fecha,
  }) : super(key: key);

  @override
  _MyCard createState() => _MyCard();
}

class _MyCard extends State<MyCard>{
  late int index;
  late int id;
  late String nombre;
  late String apellido;
  late String telefono;
  late String fecha;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index=widget.index;
    id=widget.id;
    nombre=widget.nombre;
    apellido=widget.apellido;
    telefono=widget.telefono;
    fecha=widget.fecha;
  }

  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      width: double.infinity, // Ancho máximo
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5), // Márgenes a los lados
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Card(
            color: _darktheme ? Colores.colorcard_dark : Colores.colorcard, // Fondo blanco
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Bordes circulares
            ),
            elevation: 2.5, // Sombra
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Bordes circulares
              ),
              color: _darktheme ? Colores.colorcard_dark : Colores.colorcard,
              child: InkWell(
                onTap: () {
                  final _personViewModel = Provider.of<PersonViewModel>(context, listen: false);
                  _personViewModel.deletePersona(id);
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.person,
                          color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
                          size: 75.0), // Icono de persona
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Id: $id',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Nombre: $nombre',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Apellidos: $apellido',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Teléfono: $telefono',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Fecha: $fecha',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}