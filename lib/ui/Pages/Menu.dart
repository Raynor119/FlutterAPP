import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:votacion/ui/Componentes/Colores.dart' as Colores;
import 'package:votacion/ui/Pages/AgregarPesonas.dart';
import 'package:votacion/ui/Pages/ListaPersonas.dart';

class Menu extends StatelessWidget {
  final String Usuario;
  final String Contra;
  const Menu(this.Usuario,this.Contra,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
        title: Text("Menu"),
        titleTextStyle: TextStyle(
            color: _darktheme ? Colors.white : Colors.white, fontSize: 22),
        iconTheme: IconThemeData(
          color: _darktheme ? Colors.white : Colors.white, // Cambia el color de la flecha según el tema
        ),
      ),
      body: Page(Usuario,Contra),
    );
  }
}


class BA_Persona extends StatefulWidget {
  const BA_Persona({Key? key}) : super(key: key);

  @override
  _BA_Persona createState() => _BA_Persona();
}
class _BA_Persona extends State<BA_Persona> {
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AgregarPersonas()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _darktheme
            ? Colores.coloarPrimarioDark
            : Colores.coloarPrimario, // Color de fondo del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
          side: BorderSide(
            color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
          ), // Borde del mismo color que el fondo
        ),
      ),
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
        child: const Text(
          'Agregar Personas',
          style: const TextStyle(
            fontSize: 16.0, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.white, // Color del texto
          ),
        ),
      ),
    );
  }
}

class BL_Persona extends StatefulWidget {
  const BL_Persona({Key? key}) : super(key: key);

  @override
  _BL_Persona createState() => _BL_Persona();
}
class _BL_Persona extends State<BL_Persona> {
  @override
  Widget build(BuildContext context) {
    bool _darktheme = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListaPersonas()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _darktheme
            ? Colores.coloarPrimarioDark
            : Colores.coloarPrimario, // Color de fondo del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
          side: BorderSide(
            color: _darktheme ? Colores.coloarPrimarioDark : Colores.coloarPrimario,
          ), // Borde del mismo color que el fondo
        ),
      ),
      child: const Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
        child: const Text(
          'Ver el listado de Personas',
          style: const TextStyle(
            fontSize: 16.0, // Tamaño de la fuente
            fontWeight: FontWeight.bold, // Negrita
            color: Colors.white, // Color del texto
          ),
        ),
      ),
    );
  }
}


class Page extends StatefulWidget {
  final String Usuario;
  final String Contra;
  Page(this.Usuario,this.Contra,{Key? key}) : super(key: key);
  @override
  _Page createState() => _Page();
}

class _Page extends State<Page>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: BA_Persona(),
          ),
          SizedBox(height: 30,),
          Container(
            child: BL_Persona(),
          ),
        ],
      ),
    );
  }
}

