import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:votacion/ui/Componentes/Colores.dart' as Colores;


class ListaPersonas extends StatelessWidget {
  const ListaPersonas({Key? key}) : super(key: key);
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

class _Page extends State<Page>{
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Center(
      child: Container(
        color: _darktheme ? Colores.negrototal : Colores.fondomodoblanco,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            MyCard(),
          ],
        ),
      ),
    );
  }
}


class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Container(
      width: double.infinity, // Ancho máximo
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5), // Márgenes a los lados
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child:  Card(
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
                  print('Hola');
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.person,
                          color:  _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
                          size: 75.0), // Icono de persona
                      SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nombre: Juan',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Apellidos: Pérez',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Teléfono: 123456789',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Fecha: 01/05/2024',
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