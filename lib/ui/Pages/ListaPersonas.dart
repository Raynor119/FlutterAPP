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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

        ],
      ),
    );
  }
}